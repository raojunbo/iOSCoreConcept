//
//  TestContextView.m
//  testdown
//
//  Created by rjb on 2017/12/1.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestContextView.h"

@implementation TestContextView

- (void)drawRect:(CGRect)rect{
    //通过设置不同的上下文，来切换环境
    //1:获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2:将ctx拷贝一份到栈中
    UIGraphicsPushContext(ctx);
//    CGContextSaveGState(ctx);
    CGContextSetLineWidth(ctx, 4);
    [[UIColor redColor] set];
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 120, 190);
    CGContextStrokePath(ctx);
    CGContextSetLineWidth(ctx, 2);
    UIGraphicsPopContext();
    [[UIColor greenColor]set];
    CGContextMoveToPoint(ctx, 10, 70);
    CGContextAddLineToPoint(ctx, 220, 290);
    CGContextStrokePath(ctx);
}

@end
