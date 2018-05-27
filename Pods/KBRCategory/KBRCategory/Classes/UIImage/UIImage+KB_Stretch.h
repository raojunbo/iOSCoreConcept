//
//  UIImage+KB_Stretch.h
//  KBFoundation
//
//  Created by rjb on 2018/3/16.
//  Copyright © 2018年 BookerReading. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KB_Stretch)

+ (UIImage *)stretchHorizontalCenterImage:(NSString *)imageName ;

+ (UIImage *)stretchVerticlCenterImage:(NSString *)imageName ;

- (UIImage *)stretchableImageWithCenter;

- (UIImage *)stretchableImageWithPoint:(CGPoint)point;

- (UIImage *)stretchableImageWithEdgeInsets:(UIEdgeInsets)insets;

@end
