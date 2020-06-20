//
//  UIView+Utils.h
//  UIView+Utils
//
//  Created by jv on 2017/6/20.
//  Copyright © 2017年 jv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

#pragma mark - CGRect
- (CGFloat) left;
- (void)    setLeft:(CGFloat) left;
- (CGFloat) right;
- (void)    setRight:(CGFloat) right;
- (CGFloat) top;
- (void)    setTop:(CGFloat) top;
- (CGFloat) bottom;
- (void)    setBottom:(CGFloat) bottom;
- (CGFloat) centerX;
- (void)    setCenterX:(CGFloat)centerX;
- (CGFloat) centerY;
- (void)    setCenterY:(CGFloat)centerY;
- (CGFloat) width;
- (void)    setWidth:(CGFloat)width;
- (CGFloat) height;
- (void)    setHeight:(CGFloat)height;
- (CGPoint) origin;
- (void)    setOrigin:(CGPoint)origin;
- (CGSize)  size;
- (void)    setSize:(CGSize)size;

#pragma mark - subviews
- (void)    removeAllSubviews;

#pragma mark - transform
- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

#pragma mark - border
- (void) randomBorder;
- (void) redBorder;
- (void) brownBorder;
- (void) blackBorder;
- (void) yellowBorder;
- (void) greenBorder;
- (void) blueBorder;
- (void) purpleBorder;
- (void) cyanBorder;
- (void) orangeBorder;
- (void) magentaBorder;
- (void) borderByColor:(UIColor *)color;

@end
