//
//  ButtonView.m
//  testdown
//
//  Created by rjb on 2017/12/12.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "ButtonView.h"


@interface ButtonView()
@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;
@end

@implementation ButtonView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_target performSelector:_action withObject:nil afterDelay:0];
}

- (void)addTarget:(id) target action:(SEL)action{
    self.target = target;
    self.action = action;
}

@end
