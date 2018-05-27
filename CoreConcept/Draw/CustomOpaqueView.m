//
//  CustomOpaqueView.m
//  testdown
//
//  Created by rjb on 2018/5/15.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "CustomOpaqueView.h"

@implementation CustomOpaqueView




- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect    myFrame = self.bounds;
    
    // Set the line width to 10 and inset the rectangle by
    // 5 pixels on all sides to compensate for the wider line.
    CGContextSetLineWidth(context, 10);
    CGRectInset(myFrame, 5, 5);
    
    [[UIColor redColor] set];
    UIRectFrame(myFrame);
}


@end
