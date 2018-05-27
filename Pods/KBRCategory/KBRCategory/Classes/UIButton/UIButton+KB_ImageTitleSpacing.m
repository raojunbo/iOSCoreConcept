//
//  .m
//  SystemPreferenceDemo
//
//  Created by moyekong on 12/28/15.
//  Copyright © 2015 wiwide. All rights reserved.
//

#import "UIButton+KB_ImageTitleSpacing.h"

@implementation UIButton (KB_ImageTitleSpacing)

//- (void)kb_layoutButtonWithEdgeInsetsStyle:(KBButtonEdgeInsetsType)aType
//                           imageTitleaSpace:(CGFloat)aSpace
//                                 imageSize:(CGSize)aImageSize
//{
//    // 得到imageView和titleLabel的宽、高
//    CGFloat imageWith = aImageSize.width;
//    CGFloat imageHeight = aImageSize.height;
//    
//    CGFloat labelWidth = 0.0;
//    CGFloat labelHeight = 0.0;
//    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
//    {
//        // 由于iOS8中titleLabel的size为0，用下面的这种设置
//        labelWidth = self.titleLabel.intrinsicContentSize.width;
//        labelHeight = self.titleLabel.intrinsicContentSize.height;
//    }
//    else
//    {
//        labelWidth = self.titleLabel.frame.size.width;
//        labelHeight = self.titleLabel.frame.size.height;
//    }
//    
//    // 声明全局的imageEdgeInsets和labelEdgeInsets
//    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
//    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
//    
//    // 根据style和aSpace得到imageEdgeInsets和labelEdgeInsets的值
//    switch (aType)
//    {
//        case KBButtonEdgeInsetsStyleTop:
//        {
//            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-aSpace/2.0, 0, 0, -labelWidth);
//            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-aSpace/2.0, 0);
//        }
//            break;
//        case KBButtonEdgeInsetsStyleLeft:
//        {
//            imageEdgeInsets = UIEdgeInsetsMake(0, -aSpace/2.0, 0, aSpace/2.0);
//            labelEdgeInsets = UIEdgeInsetsMake(0, aSpace/2.0, 0, -aSpace/2.0);
//        }
//            break;
//        case KBButtonEdgeInsetsStyleBottom:
//        {
//            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-aSpace/2.0, -labelWidth);
//            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-aSpace/2.0, -imageWith, 0, 0);
//        }
//            break;
//        case KBButtonEdgeInsetsStyleRight:
//        {
//            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+aSpace/2.0, 0, -labelWidth-aSpace/2.0);
//            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-aSpace/2.0, 0, imageWith+aSpace/2.0);
//        }
//            break;
//        default:
//            break;
//    }
//    
//    self.titleEdgeInsets = labelEdgeInsets;
//    self.imageEdgeInsets = imageEdgeInsets;
//}

- (void)kb_imagePositionStyle:(KBButtonEdgeInsetsType)imagePositionStyle spacing:(CGFloat)spacing
{
    if (imagePositionStyle == KBImagePositionStyleDefault) {
        self.imageEdgeInsets = UIEdgeInsetsMake(0, - 0.5 * spacing, 0, 0.5 * spacing);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0.5 * spacing, 0, - 0.5 * spacing);
    } else if (imagePositionStyle == KBImagePositionStyleRight) {
        CGFloat imageW = self.imageView.image.size.width;
        CGFloat titleW = self.titleLabel.frame.size.width;
        CGFloat imageOffset = titleW + 0.5 * spacing;
        CGFloat titleOffset = imageW + 0.5 * spacing;
        self.imageEdgeInsets = UIEdgeInsetsMake(0, imageOffset, 0, - imageOffset);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - titleOffset, 0, titleOffset);
    } else if (imagePositionStyle == KBImagePositionStyleTop) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        self.imageEdgeInsets = UIEdgeInsetsMake(- titleIntrinsicContentSizeH - spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, - imageH - spacing, 0);
    } else if (imagePositionStyle == KBImagePositionStyleBottom) {
        CGFloat imageW = self.imageView.frame.size.width;
        CGFloat imageH = self.imageView.frame.size.height;
        CGFloat titleIntrinsicContentSizeW = self.titleLabel.intrinsicContentSize.width;
        CGFloat titleIntrinsicContentSizeH = self.titleLabel.intrinsicContentSize.height;
        self.imageEdgeInsets = UIEdgeInsetsMake(titleIntrinsicContentSizeH + spacing, 0, 0, - titleIntrinsicContentSizeW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageW, imageH + spacing, 0);
    }
}

@end
