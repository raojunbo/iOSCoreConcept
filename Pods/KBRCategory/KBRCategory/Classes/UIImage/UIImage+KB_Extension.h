//
//  UIImage+KB_Extension.h
//  KBFoundation
//
//  Created by WangYouming on 2018/3/12.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KB_Extension)
+ (UIImage *)kb_imageWithPathName:(NSString *)pathName;
//+ (UIImage *)kb_imageWithColor:(UIColor *)color size:(CGSize)size;


+ (UIImage *)kb_imageFromContentFile:(NSString *)pathName;

@end
