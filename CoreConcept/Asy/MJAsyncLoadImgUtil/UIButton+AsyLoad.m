//
//  UIButton+AsyLoad.m
//  MojiWeather
//
//  Created by Admin on 2019/3/7.
//  Copyright © 2019 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import "UIButton+AsyLoad.h"
#import "UIView+AsyOperation.h"
#import "MJAsyncLoadImgUtil.h"
@implementation UIButton (AsyLoad)

- (void)asyload_imageName:(NSString *)imageName forState:(UIControlState)state{
    [self mj_cancelImageLoadOperationWithKey:NSStringFromClass([self class])];
    AsyDrawOperation *operation = [MJAsyncLoadImgUtil asyncLoadImgWithImgName:imageName block:^(UIImage * _Nonnull image) {
         [self setImage:image forState:state];
    }];
    [self mj_setImageLoadOperation:operation forKey:NSStringFromClass([self class])];
}

@end
