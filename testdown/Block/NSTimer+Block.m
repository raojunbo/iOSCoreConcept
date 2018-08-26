//
//  NSTimer+Block.m
//  testdown
//
//  Created by 饶君波 on 2018/8/22.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "NSTimer+Block.h"

@implementation NSTimer (Block)
+ (NSTimer *)rjb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                          block:(void(^)())block
                                        repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(rjb_blockinvoke:) userInfo:[block copy] repeats:YES];
}

+ (void)rjb_blockinvoke:(NSTimer *)timer {
    void (^block)() = timer.userInfo;
    if(block){
        block();
    }
}

@end
