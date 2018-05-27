//
//  DrawView2.m
//  testdown
//
//  Created by rjb on 2017/11/25.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "DrawView22.h"
#import <CoreGraphics/CoreGraphics.h>

#define BRUSH_SIZE 32

@interface DrawView22()
@property (nonatomic, strong)UIBezierPath *bpath;
@end

@implementation DrawView22

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpView];
    }
    return self;
}

+ (Class)layerClass{
    return [CAShapeLayer class];
}

-(void)setUpView{
    self.bpath = [[UIBezierPath alloc]init];
    self.bpath.lineJoinStyle = kCGLineJoinRound;
    self.bpath.lineCapStyle = kCGLineCapRound;
    self.bpath.lineWidth = 5;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    [self.bpath moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    [self.bpath addLineToPoint:point];
    [self setNeedsDisplay];
    [self setNeedsLayout];
}

#pragma --mark-- 告诉去绘制，但我这里，没有调用父类的方法，怎么将数据传给CAlayer

- (void)drawRect:(CGRect)rect{
    //对context的理解,在context里写了信息，UIView实际会调用CAlayer的绘制方法
//    CGContextRef
//    CGContextRef  ctx = UIGraphicsGetCurrentContext();
    //这里UIView实际包装了，CGContextRef,
//    [[UIColor clearColor]setFill];
//    [[UIColor redColor]setStroke];
    [self.bpath stroke];
}


#pragma --mark-- 一下是CALayer实现的协议,在这里的作用是继承了UIView的方法
//- (void)displayLayer:(CALayer *)layer{
//    NSLog(@"displayLayer");
//}
//
//- (void)layerWillDraw:(CALayer *)layer{
//    NSLog(@"layerWillDraw");
//
//}
//
//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
//    NSLog(@"drawLayer");
//}
//
//- (void)layoutSublayersOfLayer:(CALayer *)layer{
//    NSLog(@"layoutSublayersOfLayer");
//
//}

//-(id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
//    return nil;
//}

@end
