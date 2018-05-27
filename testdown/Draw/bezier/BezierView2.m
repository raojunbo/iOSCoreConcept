//
//  BezierView2.m
//  testdown
//
//  Created by rjb on 2017/12/15.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "BezierView2.h"

@implementation BezierView2

- (void)drawRect:(CGRect)rect{
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    // Move to the start of the path, at the right side [bezierPath moveToPoint: CGPointMake(883.23, 430.54)]; // p0
    // Add the cubic segments
    [bezierPath addCurveToPoint: CGPointMake(749.25, 358.4) // p1
                  controlPoint1: CGPointMake(873.68, 370.91) controlPoint2: CGPointMake(809.43, 367.95)];
    
    [bezierPath addCurveToPoint: CGPointMake(668.1, 353.25) // p2
                  controlPoint1: CGPointMake(721.92, 354.07)
                  controlPoint2: CGPointMake(690.4, 362.15)];
    
    [bezierPath addCurveToPoint: CGPointMake(492.9, 156.15) // p3
                  controlPoint1: CGPointMake(575.39, 316.25)
                  controlPoint2: CGPointMake(629.21, 155.47)];
    bezierPath.lineWidth= 2;
}

@end
