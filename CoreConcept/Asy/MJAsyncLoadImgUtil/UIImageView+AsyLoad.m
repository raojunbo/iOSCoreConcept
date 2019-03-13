//
//  UIImageView+AsyLoad.m
//  MojiWeather
//
//  Created by Admin on 2019/3/7.
//  Copyright © 2019 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import "UIImageView+AsyLoad.h"
#import "MJAsyncLoadImgUtil.h"
#import "UIView+AsyOperation.h"

@implementation UIImageView (AsyLoad)

- (void)asyload_imageName:(NSString *)imageName {
    [self mj_cancelImageLoadOperationWithKey:NSStringFromClass([self class])];
    AsyDrawOperation *operation = [MJAsyncLoadImgUtil asyncLoadImgWithImgName:imageName block:^(UIImage * _Nonnull image) {
        self.image = image;
    }];
    [self mj_setImageLoadOperation:operation forKey:NSStringFromClass([self class])];
}

@end
