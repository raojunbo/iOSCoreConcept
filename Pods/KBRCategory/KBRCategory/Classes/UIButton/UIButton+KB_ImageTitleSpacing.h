//
//  UIButton+ImageTitleSpacing.h
//  SystemPreferenceDemo
//
//  Created by moyekong on 12/28/15.
//  Copyright © 2015 wiwide. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KBButtonEdgeInsetsType)
{
    /// 图片在左，文字在右
    KBImagePositionStyleDefault,
    /// 图片在右，文字在左
    KBImagePositionStyleRight,
    /// 图片在上，文字在下
    KBImagePositionStyleTop,
    /// 图片在下，文字在上
    KBImagePositionStyleBottom,
};

@interface UIButton (KB_ImageTitleSpacing)

///**
// 设置 uibutton 图片文字的排列
//
// @param aStyle 排列类型
// @param aSpace 文字图片间距
// @param aImageSize 图片大小
// */
//- (void)kb_layoutButtonWithEdgeInsetsStyle:(KBButtonEdgeInsetsType)aType
//                          imageTitleaSpace:(CGFloat)aSpace
//                                 imageSize:(CGSize)aImageSize;

/**
 *  设置图片与文字样式
 *
 *  @param imagePositionStyle     图片位置样式
 *  @param spacing                图片与文字之间的间距
 */
- (void)kb_imagePositionStyle:(KBButtonEdgeInsetsType)imagePositionStyle spacing:(CGFloat)spacing;

@end
