//
//  NSObject+UIView_KB_Extension.h
//  KBFoundation
//
//  Created by lihui on 2018/3/9.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (KB_Extension) <UIGestureRecognizerDelegate>
- (void)kb_whenTapped:(dispatch_block_t)block;
+ (UIWindow *)kb_frontWindow;
+ (UIWindow *)kb_keyWindow;
@end

@interface UIView (KB_Geometry)

@property (nonatomic) CGFloat kb_left;
@property (nonatomic) CGFloat kb_top;
@property (nonatomic) CGFloat kb_right;
@property (nonatomic) CGFloat kb_bottom;
@property (nonatomic) CGPoint kb_origin;
@property (nonatomic, assign) CGSize kb_size;
@property (nonatomic, assign) CGFloat kb_width;
@property (nonatomic, assign) CGFloat kb_height;
@property (nonatomic, assign) CGFloat kb_centerX;
@property (nonatomic, assign) CGFloat kb_centerY;

@end


