//
//  TouchView2.m
//  testdown
//
//  Created by rjb on 2017/12/12.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TouchView2.h"

@implementation TouchView2

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    return YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchview2 began");
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
      NSLog(@"touchview2 move");
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     NSLog(@"touchview2 cancle");
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     NSLog(@"touchview2 end");
}

@end
