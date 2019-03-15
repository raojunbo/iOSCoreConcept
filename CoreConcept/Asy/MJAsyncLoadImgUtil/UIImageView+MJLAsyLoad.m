//
//  UIImageView+AsyLoad.m
//  MojiWeather
//
//  Created by Admin on 2019/3/7.
//  Copyright © 2019 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import "UIImageView+MJLAsyLoad.h"
#import "MJLAsyncLoadImgUtil.h"
#import "UIView+AsyOperation.h"

@implementation UIImageView (MJLAsyLoad)

- (void)mj_asyloadImageName:(NSString *)imageName {
    [self mj_cancelImageLoadOperationWithKey:NSStringFromClass([self class])];
    AsyDrawOperation *operation = [MJLAsyncLoadImgUtil asyncLoadImgWithImgName:imageName block:^(UIImage * _Nonnull image) {
        self.image = image;
    }];
    [self mj_setImageLoadOperation:operation forKey:NSStringFromClass([self class])];
}

- (void)mj_asyloadImageUniqueKey:(NSString *)uniqueKey preHandler:(UIImage *(^)(NSString *imageName))handler {
    [self mj_cancelImageLoadOperationWithKey:NSStringFromClass([self class])];
    AsyDrawOperation *operation = [MJLAsyncLoadImgUtil asyncLoadImgWithKey:uniqueKey handler:handler block:^(UIImage *image) {
         self.image = image;
    }];
    [self mj_setImageLoadOperation:operation forKey:NSStringFromClass([self class])];
}

@end
