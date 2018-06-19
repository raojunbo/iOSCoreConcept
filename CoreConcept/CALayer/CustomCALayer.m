//
//  CustomCALayer.m
//  testdown
//
//  Created by rjb on 2018/5/17.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "CustomCALayer.h"
#import <UIKit/UIKit.h>
@implementation CustomCALayer

- (void)drawInContext:(CGContextRef)ctx {
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,15.0f,15.f);
    CGPathAddCurveToPoint(thePath,
                          NULL,
                          15.f,250.0f,
                          295.0f,250.0f,
                          295.0f,15.0f);
    
    CGContextBeginPath(ctx);
    CGContextAddPath(ctx, thePath);
    
    CGContextSetLineWidth(ctx, 5);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 0, 1);
    CGContextStrokePath(ctx);
    CGImageRef cgImage = [[UIImage imageNamed:@"text2"] CGImage];
    CGContextDrawImage(ctx, CGRectMake(0, 0, 20, 20), cgImage);
    CFRelease(thePath);
}

- (CALayer *)hitTest:(CGPoint)p {
    return self;
}


@end
