//
//  AnimationActionView.m
//  testdown
//
//  Created by rjb on 2018/5/17.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "AnimationActionView.h"
#import "AnimationActionLayer.h"

@interface AnimationActionView()

@end

@implementation AnimationActionView

+(Class)layerClass {
    return [AnimationActionLayer class];
}

//重写父类的对于event的方法
- (nullable id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
    NSLog(@"layer:%@---event:%@",layer,event);
    return nil;
}

@end
