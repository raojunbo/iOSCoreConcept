//
//  AnimationActionLayer.m
//  testdown
//
//  Created by rjb on 2018/5/17.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "AnimationActionLayer.h"

@implementation AnimationActionLayer


//重写弗父类的方法
- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key {
    NSLog(@"anim:%@",[anim description]);
    NSLog(@"key:%@",key);
    [super addAnimation:anim forKey:key];
}


@end
