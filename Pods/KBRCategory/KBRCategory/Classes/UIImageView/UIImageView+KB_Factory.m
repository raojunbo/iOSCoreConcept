//
//  UIImageView+KB_Factory.m
//  BookerReading-Apple
//
//  Created by lihui on 2018/3/15.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import "UIImageView+KB_Factory.h"

@implementation UIImageView (KB_Factory)

+ (UIImageView *)kb_createImageView:(UIImage *)aImage
{
    return [[UIImageView alloc] initWithImage:aImage];
}

+ (UIImageView *)kb_createImageView:(UIImage *)aImage contentMode:(UIViewContentMode)aMode
{
    UIImageView *view = [[UIImageView alloc] initWithImage:aImage];
    view.contentMode = aMode;
    return view;
}

@end
