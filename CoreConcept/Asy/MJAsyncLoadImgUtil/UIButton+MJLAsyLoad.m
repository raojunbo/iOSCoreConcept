//
//  UIButton+AsyLoad.m
//  MojiWeather
//
//  Created by Admin on 2019/3/7.
//  Copyright © 2019 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import "UIButton+MJLAsyLoad.h"
#import "UIView+AsyOperation.h"
#import "MJLAsyncLoadImgUtil.h"

@implementation UIButton (MJLAsyLoad)

static NSString *oprationStateKey(NSString *string, UIControlState state) {
    return [NSString stringWithFormat:@"%@_%@",string,@(state)];
}

- (void)mj_asyloadImageName:(NSString *)imageName forState:(UIControlState)state{
    [self mj_cancelImageLoadOperationWithKey:oprationStateKey(NSStringFromClass([self class]),state)];
    AsyDrawOperation *operation = [MJLAsyncLoadImgUtil asyncLoadImgWithImgName:imageName block:^(UIImage * _Nonnull image) {
         [self setImage:image forState:state];
    }];
    [self mj_setImageLoadOperation:operation forKey:NSStringFromClass([self class])];
}

- (void)mj_asyloadImageUniqueKey:(NSString *)uniqueKey
                    preHandler:(UIImage *(^)(NSString *imageName))handler
                      forState:(UIControlState)state {
    [self mj_cancelImageLoadOperationWithKey:oprationStateKey(NSStringFromClass([self class]),state)];
    AsyDrawOperation *operation = [MJLAsyncLoadImgUtil asyncLoadImgWithKey:uniqueKey handler:handler block:^(UIImage *image) {
         [self setImage:image forState:state];
    }];
    [self mj_setImageLoadOperation:operation forKey:NSStringFromClass([self class])];
}
@end
