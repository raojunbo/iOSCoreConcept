//
//  MJAsyncLoadImgUtil.m
//  MojiWeather
//
//  Created by Admin on 2019/3/11.
//  Copyright © 2019 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import "MJAsyncLoadImgUtil.h"
#import "YYCache.h"
#import "YYImageCoder.h"

static NSString *const kDrawImageCompletedCallbackKey = @"DrawCompleted";
static NSString *const kDrawImageOperationQueueKey = @"com.MJAsyncLoadImgUtil.AsyDraw.op";
static NSString *const kDrawImageMemoryCacheNameKey = @"com.MJAsyncLoadImgUtil.AsyDraw.memCache";
static char *const kDrawImageDispathBarrierQueueNameKey = "com.MJAsyncLoadImgUtil.barrierQueue";

static NSArray *_NSBundlePreferredScales() {
    static NSArray *scales;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat screenScale = [UIScreen mainScreen].scale;
        if (screenScale <= 1) {
            scales = @[@1,@2,@3];
        } else if (screenScale <= 2) {
            scales = @[@2,@3,@1];
        } else {
            scales = @[@3,@2,@1];
        }
    });
    return scales;
}

static NSString *_NSStringByAppendingNameScale(NSString *string, CGFloat scale) {
    if (!string) return nil;
    if (fabs(scale - 1) <= __FLT_EPSILON__ || string.length == 0 || [string hasSuffix:@"/"]) return string.copy;
    return [string stringByAppendingFormat:@"@%@x", @(scale)];
}

@implementation AsyDrawOperation

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}

- (instancetype)initWithOperationBlock:(VoidBlock)block{
    if(self = [super init]){
        _block = block;
    }
    return self;
}

- (void)main {
    if(self.block){
        self.block();
    }
}

@end

/*
 内存缓存 ok（不做磁盘缓存的原因，同一app,在不同的版本里，相同名字的图片名，可能对应的图片不一样）
 同一时间，同一path,只做一次operation
 同一时间，同一Path ,可能会有多个回调
 */
@interface MJAsyncLoadImgUtil()
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) YYMemoryCache *mCache;//只做内存缓存
@property (nonatomic, strong) NSMutableDictionary<NSString *, AsyDrawOperation *> *PathOperations;//同一个path，只做一次opration
@property (nonatomic, strong) NSMutableDictionary<NSString *,NSMutableArray *> *PathCallBacks;//同一个path，可能有多个
@property (nonatomic, strong) dispatch_queue_t barrierQueue;//保护pathCallBacks
@end

@implementation MJAsyncLoadImgUtil

+ (MJAsyncLoadImgUtil *)sharedInstance {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init {
    if(self = [super init]){
        NSInteger queueCount = 6;
        _operationQueue = [[NSOperationQueue alloc] init];
        _operationQueue.name = kDrawImageOperationQueueKey;
        _operationQueue.maxConcurrentOperationCount = queueCount;
        
        _mCache = [[YYMemoryCache alloc]init];
        _mCache.name = kDrawImageMemoryCacheNameKey;
        //_mCache.costLimit = 10*1024*1024;//10M

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveMemoryWarning) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
        
        _PathOperations = [[NSMutableDictionary alloc]init];
        _PathCallBacks = [[NSMutableDictionary alloc]init];
        
        _barrierQueue = dispatch_queue_create(kDrawImageDispathBarrierQueueNameKey, DISPATCH_QUEUE_CONCURRENT);

    }
    return self;
}

+ (AsyDrawOperation *)asyncLoadImgWithKey:(NSString *)imgUniqueKey handler:(UIImage *(^)(NSString *imageName))drawHandler block:(DrawCompleteBlock)block {
    return  [[MJAsyncLoadImgUtil sharedInstance] _asyncLoadImgWithKey:imgUniqueKey handler:drawHandler block:block];
}

+ (AsyDrawOperation *)asyncLoadImgWithImgName:(NSString *)imgName block:(DrawCompleteBlock)block {
    return  [[MJAsyncLoadImgUtil sharedInstance] _asyncLoadImgWithImgName:imgName block:block];
}

- (AsyDrawOperation *)_asyncLoadImgWithImgName:(NSString *)imgName block:(DrawCompleteBlock)block {
    NSString *imgPath = [self pathWithName:imgName];
    return  [[MJAsyncLoadImgUtil sharedInstance] _asyncLoadImgWithKey:imgPath handler:^UIImage *(NSString *imgUniqueKey) {
        UIImage *image = [UIImage imageWithContentsOfFile:imgPath];
        if(!image){
            return nil;
        }
        image = [image yy_imageByDecoded];//用yyDecode解码
        return image;
    } block:block];
}

- (AsyDrawOperation *)_asyncLoadImgWithKey:(NSString *)imgUniqueKey handler:(UIImage *(^)(NSString *imgUniqueKey))drawHandler block:(DrawCompleteBlock)completeBlock {
    if(!imgUniqueKey || imgUniqueKey.length == 0){
        !completeBlock?:completeBlock(nil);
        return nil;
    }
    UIImage *image = [[MJAsyncLoadImgUtil sharedInstance] queryImageInMemoryForKey:imgUniqueKey];
    if(image){
        !completeBlock?:completeBlock(image);
    }else{
        __weak typeof(self) wSelf = self;
        
        //同一个path只会做一次异步operation
        AsyDrawOperation *drawOperation = [self.PathOperations objectForKey:imgUniqueKey];
        if(!drawOperation){
            drawOperation = [[AsyDrawOperation alloc]initWithOperationBlock:^{
                __strong typeof(wSelf) strongSelf = wSelf;
                UIImage *image = nil;
                if(drawHandler){
                    image = drawHandler(imgUniqueKey);
                }
                if(image){
                    [[MJAsyncLoadImgUtil sharedInstance] cacheImage:image ForKey:imgUniqueKey];
                }
                //处理同一个path，多次请求的调
                __block NSArray * callbacksForURL;
                dispatch_barrier_sync(strongSelf.barrierQueue, ^{
                    callbacksForURL = [strongSelf.PathCallBacks[imgUniqueKey] copy];
                    [strongSelf.PathCallBacks removeObjectForKey:imgUniqueKey];
                });
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    for (NSDictionary *callbacks in callbacksForURL) {
                        DrawCompleteBlock callback = callbacks[kDrawImageCompletedCallbackKey];
                        if (callback){
                            callback(image);
                        }
                    }
                });
                
            }];
            drawOperation.completionBlock = ^{
                @synchronized (self.PathOperations) {
                    [self.PathOperations removeObjectForKey:imgUniqueKey];
                }
            };
           
            drawOperation.name = imgUniqueKey;
            [self.operationQueue addOperation:drawOperation];
            @synchronized (self.PathOperations) {
                [self.PathOperations setObject:drawOperation forKey:imgUniqueKey];
            }
        }
        //设置block,处理同一个path，多次请求绘制的回调
        [self addCompletedBlock:completeBlock forPath:imgUniqueKey];
        return drawOperation;
    }
    return nil;
}

- (void)addCompletedBlock:(DrawCompleteBlock)completeBlock forPath:(NSString *)imgUniqueKey {
    if (imgUniqueKey == nil) {
        if (completeBlock != nil) {
            completeBlock(nil);
        }
        return;
    }
    dispatch_barrier_sync(self.barrierQueue, ^{
        if (!self.PathCallBacks[imgUniqueKey]) {
            self.PathCallBacks[imgUniqueKey] = [NSMutableArray new];
        }
        NSMutableArray *callbacksForPath = self.PathCallBacks[imgUniqueKey];
        NSMutableDictionary *callbacks = [NSMutableDictionary new];
        if (completeBlock) callbacks[kDrawImageCompletedCallbackKey] = [completeBlock copy];
        [callbacksForPath addObject:callbacks];
        self.PathCallBacks[imgUniqueKey] = callbacksForPath;
    });
}

- (UIImage *)queryImageInMemoryForKey:(NSString *)key {
    return [self.mCache objectForKey:key];
}

- (void)cacheImage:(UIImage *)image ForKey:(NSString *)key {
    if(image){
        [self.mCache setObject:image forKey:key];
    }
}

- (NSString *)pathWithName:(NSString *)name {
    NSString *res = name.stringByDeletingPathExtension;
    NSString *path = nil;
    CGFloat scale = 1;
    NSArray *exts =  @[@"", @"png", @"jpeg", @"jpg", @"gif", @"webp"];
    NSArray *scales = _NSBundlePreferredScales();
    for (int s = 0; s < scales.count; s++) {
        scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = _NSStringByAppendingNameScale(res, scale);
        for (NSString *e in exts) {
            path = [[NSBundle mainBundle] pathForResource:scaledName ofType:e];
            if (path) break;
        }
        if (path) break;
    }
    return path;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [self.mCache removeAllObjects];
}

@end
