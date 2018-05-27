//
//  AnimationCustomView.m
//  testdown
//
//  Created by rjb on 2017/11/17.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "AnimationCustomView.h"

@implementation AnimationCustomView

//- (void)drawRect:(CGRect)rect{
//    NSLog(@"我：drawRect");
////    CATiledLayer *tiledLayer = [[CATiledLayer alloc]ini];
//
//    //drawRect里的
//}

//下面是layer的代理方法
//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
//    NSLog(@"我；drawLayer");
//    //layer的CGContextRef会提供
//    //因为我本来就有内部层，谁来告诉我去调用者个方法
//    //实际上是UIView会为其创建CGContextRef，
//    //这主线程里设置view的,那么主线程又是不停的检测需要绘制的东西，setNeedsDisplay
//}
//
//
//- (void)layerWillDraw:(CALayer *)layer{
//    NSLog(@"我：layerWillDraw");
//}
//
//- (void)displayLayer:(CALayer *)layer{
//    //我可以在这里做些什么
//    NSLog(@"我：displayLayer");
//
//}
//
//- (void)layoutSublayersOfLayer:(CALayer *)layer{
//    NSLog(@"我：layoutSublayersOfLayer");
//}
//
- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
    //我可以在这里做些什么,好像是对动画属性动画做自定会的动画//
    CABasicAnimation *basiani = [[CABasicAnimation alloc]init];
    [layer addAnimation:basiani forKey:@"backgroundColor"];
    NSLog(@"这是返回的");
    return basiani;
}

//uiviewf的方法，实际内部也是实现了layer的协议，取得了相同的CGContextRef
- (void)drawRect:(CGRect)rect{
    
}
//实现的layerDelegate的协议
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
}
@end
