//
//  NSString+KB_Size.h
//  KBFoundation
//
//  Created by rjb on 2018/3/19.
//  Copyright © 2018年 BookerReading. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (KB_Size)

/**
 返回自适应高度的文本
 */
+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxWidth:(CGFloat)maxWidth;

/**
 返回自适应宽度的文本
 */
+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxHeight:(CGFloat)maxHeight;

@end
