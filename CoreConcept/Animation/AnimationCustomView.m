//
//  AnimationCustomView.m
//  testdown
//
//  Created by rjb on 2017/11/17.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "AnimationCustomView.h"

@implementation AnimationCustomView
/*
 动画事务的基本概念
 */
//创建动画事务的目的是为了操作的原子性，保证动画的所有修改能同时生效。
//CATransaction 就是动画事务的操作类。

//在创建隐式动画的时候，系统也会隐式的创建一个动画事务，以保证所有的动画能同时进行。

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

/*
 UIView是CALayer的代理。
 - (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
是其中一个代理方法
 UIViewd的内部默认实现了这个方法，实现的方法是给CALayer去掉了隐式动画
 如果我们想自己给其添加隐式动画，可以实现整个代理方法
 CALayer 通过 - actionForKey: 来查询某个属性被修改时，需要调用哪个动画去展现这个变化。
 一般默认返回的是 CABasicAnimation ，默认动画时间 0.25秒
 */

- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
    //我可以在这里做些什么,好像是对动画属性动画做自定会的动画//
    CABasicAnimation *basiani = [[CABasicAnimation alloc]init];
    [layer addAnimation:basiani forKey:@"backgroundColor"];
    return basiani;
}

//uiviewf的方法，实际内部也是实现了layer的协议，取得了相同的CGContextRef
- (void)drawRect:(CGRect)rect{
    
}
//实现的layerDelegate的协议
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
}




@end
