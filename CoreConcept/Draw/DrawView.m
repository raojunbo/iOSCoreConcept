//
//  DrawView.m
//  testdown
//
//  Created by rjb on 2017/11/25.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "DrawView.h"


@interface DrawView()
@property (nonatomic, strong)UIBezierPath *path;
@end

@implementation DrawView

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
    self.path = [[UIBezierPath alloc]init];
    self.path.lineJoinStyle = kCGLineJoinRound;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineWidth = 5;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    [self.path addLineToPoint:point];
    [self setNeedsDisplay];
    [self setNeedsLayout];
}
#pragma --mark-- 告诉去绘制，但我这里，没有调用父类的方法，怎么将数据传给CAlayer
- (void)drawRect:(CGRect)rect{
    [[UIColor clearColor]setFill];
    [[UIColor redColor]setStroke];
    [self.path stroke];
}
#pragma --mark-- 一下是CALayer实现的协议,在这里的作用是继承了UIView的方法
//- (void)displayLayer:(CALayer *)layer{
//
//}
//
//- (void)layerWillDraw:(CALayer *)layer{
//
//}
//
//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
//
//}
//
//- (void)layoutSublayersOfLayer:(CALayer *)layer{
//
//}
//
//-(id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
//    return nil;
//}

@end
