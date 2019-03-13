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

@interface UIButton (AsyLoad)

- (void)asyload_imageName:(NSString *)imageName forState:(UIControlState)state;

@end

