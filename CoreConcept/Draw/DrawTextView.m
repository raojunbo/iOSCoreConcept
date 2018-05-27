//
//  DrawTextView.m
//  testdown
//
//  Created by rjb on 2017/12/17.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "DrawTextView.h"

@implementation DrawTextView


- (void)jj{
    NSString *string = @"hello world";
    UIFont *font = [UIFont fontWithName:@"Futura" size:36.0f];
    NSDictionary * attributes = @{NSFontAttributeName:font,
                                  NSForegroundColorAttributeName:[UIColor grayColor]
                                  };
    
    [string drawAtPoint:CGPointMake(0, 0) withAttributes:attributes];
//    UIColor *co = []
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
