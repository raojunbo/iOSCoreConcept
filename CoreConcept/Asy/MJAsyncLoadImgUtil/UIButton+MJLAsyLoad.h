//
//  UIButton+AsyLoad.h
//  MojiWeather
//
//  Created by Admin on 2019/3/7.
//  Copyright © 2019 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 异步加载本地图片
 */

@interface UIButton (MJLAsyLoad)

- (void)mj_asyloadImageName:(NSString *)imageName forState:(UIControlState)state;

- (void)mj_asyloadImageUniqueKey:(NSString *)uniqueKey
                    preHandler:(UIImage *(^)(NSString *imageName))handler
                      forState:(UIControlState)state;
@end

