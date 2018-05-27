//
//  UIScrollView+KB_Extension.m
//  KBFoundation
//
//  Created by WangYouming on 2018/3/12.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import "UIScrollView+KB_Extension.h"

@implementation UIScrollView (KB_Extension)

- (void)kb_neverAdjustContentInset {
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        [self viewController].automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
