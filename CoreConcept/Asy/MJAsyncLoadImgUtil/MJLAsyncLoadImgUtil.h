//
//  MJLAsyncLoadImgUtil.h
//  MojiWeather
//
//  Created by Admin on 2019/3/11.
//  Copyright © 2019 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^DrawCompleteBlock)(UIImage *image);
typedef void(^VoidBlock)(void);

@interface AsyDrawOperation : NSOperation
@property (nonatomic, copy) VoidBlock block;
@end

@interface MJLAsyncLoadImgUtil : NSObject

/*
 imageName: 图片名字
 block:     异步绘制后的图片
 */
+ (AsyDrawOperation *)asyncLoadImgWithImgName:(NSString *)imgName block:(DrawCompleteBlock)block;


/*
 imgUniqueKey:  外部图片的在缓存里的key
 handler:       外部提供图片绘制操作（这个操作会放在子线程里执行）
 block:         异步绘制后的图片
 */
+ (AsyDrawOperation *)asyncLoadImgWithKey:(NSString *)imgUniqueKey handler:(UIImage *(^)(NSString *imgUniqueKey))drawHandler block:(DrawCompleteBlock)block;

@end

