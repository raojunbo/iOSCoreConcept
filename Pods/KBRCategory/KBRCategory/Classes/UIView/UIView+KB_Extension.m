//
//  NSObject+UIView_KB_Extension.m
//  KBFoundation
//
//  Created by lihui on 2018/3/9.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import "UIView+KB_Extension.h"
#import <objc/runtime.h>

@implementation UIView (KB_Extension)

+ (UIWindow *)kb_frontWindow {
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
        
        if(windowOnMainScreen && windowIsVisible && windowLevelNormal) {
            return window;
        }
    }
    
    return [self kb_keyWindow];
}

+ (UIWindow *)kb_keyWindow {
    return [UIApplication sharedApplication].keyWindow;
}


static char KBWhenTappedBlockKey;
- (void)kb_whenTapped:(dispatch_block_t)block {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(kb_viewWasTapped)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, &KBWhenTappedBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)kb_viewWasTapped {
    dispatch_block_t action = objc_getAssociatedObject(self, &KBWhenTappedBlockKey);
    if (action) {
        action();
    }
}

@end

@implementation UIView (KB_Geometry)

- (CGFloat)kb_left {
    return self.frame.origin.x;
}

- (void)setKb_left:(CGFloat)x {
    CGRect frame = self.frame;
    if (frame.origin.x != x) {
        frame.origin.x = x;
        self.frame = frame;
    }
}

- (CGFloat)kb_top {
    return self.frame.origin.y;
}

- (void)setKb_top:(CGFloat)y {
    CGRect frame = self.frame;
    if (frame.origin.y != y) {
        frame.origin.y = y;
        self.frame = frame;
    }
}

- (CGFloat)kb_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setKb_right:(CGFloat)right {
    CGRect frame = self.frame;
    if (frame.origin.x != right - frame.size.width) {
        frame.origin.x = right - frame.size.width;
        self.frame = frame;
        
    }
}

- (CGFloat)kb_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setKb_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    if (frame.origin.y != bottom - frame.size.height) {
        frame.origin.y = bottom - frame.size.height;
        self.frame = frame;
        
    }
}

- (CGFloat)kb_centerX {
    return self.center.x;
}

- (void)setKb_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)kb_centerY {
    return self.center.y;
}

- (void)setKb_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)kb_width {
    return self.frame.size.width;
}

- (void)setKb_width:(CGFloat)width {
    CGRect frame = self.frame;
    if (frame.size.width != width) {
        frame.size.width = width;
    }
    self.frame = frame;
}

- (CGFloat)kb_height {
    return self.frame.size.height;
}

- (void)setKb_height:(CGFloat)height {
    CGRect frame = self.frame;
    if (frame.size.height != height) {
        frame.size.height = height;
        self.frame = frame;
    }
}

- (CGPoint)kb_origin {
    return self.frame.origin;
}

- (void)setKb_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)kb_size {
    return self.frame.size;
}

- (void)setKb_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end


