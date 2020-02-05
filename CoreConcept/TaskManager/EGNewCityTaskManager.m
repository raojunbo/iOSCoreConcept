//
//  EGNewCityTaskManager.m
//  CoreConcept
//
//  Created by rjb on 2020/2/3.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "EGNewCityTaskManager.h"
#import <objc/message.h>

@implementation MJLTaskModel

@end

static CFRunLoopObserverRef defaultModeObserver = NULL;

@interface EGNewCityTaskManager ()
@property (nonatomic, assign)EGNEWTaskMode currentTaskMode;
@property (nonatomic, strong) NSMutableArray <MJLTaskModel *> *taskModelArray;
@property (nonatomic, assign) BOOL isRunning;
@end

@implementation EGNewCityTaskManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static EGNewCityTaskManager *shareInstance = nil;
    dispatch_once(&onceToken, ^{
        shareInstance = [[EGNewCityTaskManager alloc]init];
    });
    return shareInstance;
}

- (instancetype)init {
    if(self = [super init]){
        self.currentTaskMode = EGWTaskModeSerial;
    }
    return self;
}

- (void)resume {
    if(self.isRunning){
        return;
    }else{
        self.isRunning = YES;
        [self runTask:0];
    }
}

- (void)changeToMode:(EGNEWTaskMode)taskMode {
    _currentTaskMode = taskMode;
    if(taskMode == EGWTaskModeSerial){
        [self moji_removeRunloopRegister:defaultModeObserver];
    }
    
    if(taskMode == EGWTaskModeInterval){
        [self moji_registerRunloopStatus:kCFRunLoopBeforeWaiting];
    }
    
    if(taskMode == EGWTaskModeStop){
        [self moji_removeRunloopRegister:defaultModeObserver];
        [self cleanTask];
    }
}

- (void)runTask:(NSInteger)index {
    if(index < 0 ||index >= self.taskModelArray.count){
        self.isRunning = NO;
        return;
    }
    
    MJLTaskModel *model = [self.taskModelArray objectAtIndex:index];
    [self realRun:model];
    
    if (self.currentTaskMode == EGWTaskModeSerial) {
         [self runTask:index];
    }else if(self.currentTaskMode == EGWTaskModeInterval){
       //nothing to do
    }else{
        [self cleanTask];
    }
}

- (void)realRun:(MJLTaskModel *)model {
    if (![model isKindOfClass:[MJLTaskModel class]]) {
        self.isRunning = NO;
        [self.taskModelArray removeObject:model];
        return;
    }
    self.isRunning = YES;
    if(![model.target respondsToSelector:model.selector]){
        //未能响应
    }else{
        objc_msgSend(model.target, model.selector);
    }
    [self.taskModelArray removeObject:model];
}

- (void)addTarget:(id)target selector:(SEL)selector {
    MJLTaskModel *model = [[MJLTaskModel alloc]init];
    model.target = target;
    model.selector = selector;
    [self.taskModelArray addObject:model];
}

- (NSMutableArray *)taskModelArray {
    if(!_taskModelArray){
        _taskModelArray = [[NSMutableArray alloc]init];
    }
    return _taskModelArray;
}

- (void)cleanTask {
     [self.taskModelArray removeAllObjects];
}

- (void)moji_registerRunloopStatus:(CFRunLoopActivity)activity {
    [self p_registerRunLoopWorkDistributionAsMainRunloopObserver:self status:activity];
}

- (void)moji_removeRunloopRegister:(CFRunLoopObserverRef)observer {
    if(observer !=NULL){
        CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
        defaultModeObserver = NULL;
    }
}

- (void)p_registerRunLoopWorkDistributionAsMainRunloopObserver:(id)runLoopObserver status:(CFRunLoopActivity)status {
   
    p_registerObserver(status, defaultModeObserver, NSIntegerMax - 999, kCFRunLoopDefaultMode, (__bridge void *)runLoopObserver, &_defaultModeRunLoopWorkDistributionCallback);
}

static void _defaultModeRunLoopWorkDistributionCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    _runLoopWorkDistributionCallback(observer, activity, info);
}

static void p_registerObserver(CFOptionFlags activities, CFRunLoopObserverRef observer, CFIndex order, CFStringRef mode, void *info, CFRunLoopObserverCallBack callback) {
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    CFRunLoopObserverContext context = {
        0,
        info,
        &CFRetain,
        &CFRelease,
        NULL
    };
    observer = CFRunLoopObserverCreate(     NULL,
                                       activities,
                                       YES,
                                       order,
                                       callback,
                                       &context);
    CFRunLoopAddObserver(runLoop, observer, mode);
    CFRelease(observer);
}

static void _runLoopWorkDistributionCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry:
            break;
        case kCFRunLoopBeforeTimers:
            break;
        case kCFRunLoopBeforeSources:
            break;
        case kCFRunLoopBeforeWaiting:
            [[EGNewCityTaskManager shareInstance]runTask:0];
            break;
        case kCFRunLoopAfterWaiting:
            
            break;
        case kCFRunLoopExit:
            break;
        default:
            break;
    }
}
@end
