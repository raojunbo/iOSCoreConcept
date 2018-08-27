//
//  ContextLineWidthView.m
//  testdown
//
//  Created by rjb on 2017/12/2.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "ContextLineWidthView.h"

@implementation ContextLineWidthView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    //取得当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    path.lineWidth = 5;
    CGContextSetLineWidth(context, 20);
    
    //上下文的状态
    [[UIColor purpleColor] set];
    CGContextAddPath(context, path.CGPath);
    CGContextStrokePath(context);
    
    //path的状态
    [[UIColor greenColor] set];
    [path stroke];
//    UIGraphicsEndImageContext();
}
@end
