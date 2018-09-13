//
//  RaoFPLabel.m
//  CoreConcept
//
//  Created by rjb on 2018/9/13.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RaoFPLabel.h"

@interface RaoFPLabel()
@property (nonatomic, strong)CADisplayLink *link;
@property (nonatomic, assign)NSUInteger count;
@property (nonatomic, assign)NSTimeInterval lastTime;
@end

@implementation RaoFPLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    }
    return self;
}

- (


@end
