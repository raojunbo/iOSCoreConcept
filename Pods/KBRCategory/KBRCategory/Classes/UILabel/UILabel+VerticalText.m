//
//  UILabel+VerticalText.m
//  KBFoundation
//
//  Created by rjb on 2018/4/2.
//  Copyright © 2018年 BookerReading. All rights reserved.
//

#import "UILabel+VerticalText.h"
#import <objc/runtime.h>

@implementation UILabel (VerticalText)

- (NSString *)verticalText {
    return objc_getAssociatedObject(self, @selector(verticalText));
}

- (void)setVerticalText:(NSString *)verticalText{
    objc_setAssociatedObject(self, &verticalText, verticalText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSMutableString *str = [[NSMutableString alloc] initWithString:verticalText];
    NSInteger count = str.length;
    for (int i = 1; i < count; i ++) {
        [str insertString:@"\n" atIndex:i*2-1];
    }
    self.text = str;
    self.numberOfLines = 0;
}

@end
