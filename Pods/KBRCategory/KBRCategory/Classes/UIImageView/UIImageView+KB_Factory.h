//
//  UIImageView+KB_Factory.h
//  BookerReading-Apple
//
//  Created by lihui on 2018/3/15.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (KB_Factory)

+ (UIImageView *)kb_createImageView:(UIImage *)aImage;
+ (UIImageView *)kb_createImageView:(UIImage *)aImage contentMode:(UIViewContentMode)aMode;

@end
