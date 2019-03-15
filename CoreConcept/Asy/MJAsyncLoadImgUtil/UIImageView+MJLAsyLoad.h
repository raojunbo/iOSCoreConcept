//
//  #import "UIImageView+MJLAsyLoad.h"
//  MojiWeather
//
//  Created by Admin on 2019/3/7.
//  Copyright © 2019 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (MJLAsyLoad)

- (void)mj_asyloadImageName:(NSString *)imageName;

- (void)mj_asyloadImageUniqueKey:(NSString *)uniqueKey preHandler:(UIImage *(^)(NSString *imageName))handler;

@end

