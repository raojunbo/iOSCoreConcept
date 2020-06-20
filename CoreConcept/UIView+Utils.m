//
//  UIView+Utils.m
//  UIView+Utils
//
//  Created by jv on 2017/6/20.
//  Copyright © 2017年 jv. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

#pragma mark - frame

- (CGFloat) left
{
    return self.frame.origin.x;
}

- (void) setLeft:(CGFloat) left
{
    CGRect frame    = self.frame;
    frame.origin.x  = left;
    self.frame      = frame;
}


- (CGFloat) right
{
    return self.frame.origin.x + self.frame.size.width;
}


- (void) setRight:(CGFloat) right
{
    CGRect frame    = self.frame;
    frame.origin.x  = right - frame.size.width;
    self.frame      = frame;
}


- (CGFloat) top
{
    return self.frame.origin.y;
}

- (void) setTop:(CGFloat) top
{
    CGRect frame    = self.frame;
    frame.origin.y  = top;
    self.frame      = frame;
}


- (CGFloat) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}


- (void) setBottom:(CGFloat) bottom
{
    CGRect frame    = self.frame;
    frame.origin.y  = bottom - frame.size.height;
    self.frame      = frame;
}


- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat) width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame     = self.frame;
    frame.size.width = width;
    self.frame       = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame      = self.frame;
    frame.size.height = height;
    self.frame        = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame   = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size   = size;
    self.frame   = frame;
}


#pragma mark - subviews

- (void)removeAllSubviews
{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}


#pragma mark - transform


- (void) moveBy: (CGPoint) delta
{
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}

- (void) scaleBy: (CGFloat) scaleFactor
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}

- (void) fitInSize: (CGSize) aSize
{
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > aSize.height))
    {
        scale = aSize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width >= aSize.width))
    {
        scale = aSize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;
}

- (void) randomBorder {
    [self borderByColor:[UIColor colorWithRed:((arc4random() % 256) / 255.) green:((arc4random() % 256) / 255.) blue:((arc4random() % 256) / 255.) alpha:1]];
}

- (void) redBorder {
    [self borderByColor:[UIColor redColor]];
}

- (void) brownBorder {
    [self borderByColor:[UIColor brownColor]];
}

- (void) blackBorder {
    [self borderByColor:[UIColor blackColor]];
}

- (void) yellowBorder {
    [self borderByColor:[UIColor yellowColor]];
}

- (void) greenBorder {
    [self borderByColor:[UIColor greenColor]];
}

- (void) blueBorder {
    [self borderByColor:[UIColor blueColor]];
}

- (void) purpleBorder {
    [self borderByColor:[UIColor purpleColor]];
}

- (void) cyanBorder {
    [self borderByColor:[UIColor cyanColor]];
}

- (void) orangeBorder {
    [self borderByColor:[UIColor orangeColor]];
}

- (void) magentaBorder {
    [self borderByColor:[UIColor magentaColor]];
}

- (void) borderByColor:(UIColor *)color {
    if (color == nil) {
        color = [UIColor colorWithRed:(arc4random() % 256) / 255. green:(arc4random() % 256) / 255. blue:(arc4random() % 256) / 255. alpha:1.];
    }
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = 1.f;
}


@end
