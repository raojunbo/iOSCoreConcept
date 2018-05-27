//
//  UIImage+Color.h
//
//  Created by jiangxiaolong on 13-11-16.
//  Copyright (c) 2013年 jiangxiaolong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KB_Color)

/*
 生成带颜色的图片
 */
+ (UIImage *)kb_createImageWithColor:(UIColor *)color;
+ (UIImage *)kb_createImageWithColor:(UIColor *)color withSize:(CGSize)size;

/*
 纯色生成图片(抗锯齿)
 */
+ (UIImage *)kb_getImageWithColor:(UIColor *)color size:(CGSize)aSize;

+ (UIImage *)kb_createImageWithColor:(UIColor *)color
							 size:(CGSize)size
					 cornerRadius:(CGFloat)cornerRadius;

+(UIImage *)kb_createImageWithColor:(UIColor *)color
                            size:(CGSize)size
                    cornerRadius:(CGFloat)cornerRadius
                       roundType:(UIRectCorner) rounderCornerType;
// 生成按钮的背景图
//+ (UIImage *)resizableImageWithColor:(UIColor *)color
//                        cornerRadius:(CGFloat)cornerRadius;

/**
 颜色转换为图片
 
 @param aColor 颜色值
 @return 返回生成的uiimage
 */
+ (UIImage *)kb_imageWithColor:(UIColor *)aColor;

@end
