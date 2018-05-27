//
//  UIImage+KB_Stretch.m
//  KBFoundation
//
//  Created by rjb on 2018/3/16.
//  Copyright © 2018年 BookerReading. All rights reserved.
//

#import "UIImage+KB_Stretch.h"

@implementation UIImage (KB_Stretch)

+ (UIImage *)stretchHorizontalCenterImage:(NSString *)imageName {
    UIImage *image =  [UIImage imageNamed:imageName];
    UIImage *streImage = [image stretchableImageWithLeftCapWidth:image.size.width/2.0 topCapHeight:0];
    return streImage;
}

+ (UIImage *)stretchVerticlCenterImage:(NSString *)imageName {
    UIImage *image =  [UIImage imageNamed:imageName];
    UIImage *strechImage = [image stretchableImageWithLeftCapWidth:0 topCapHeight:image.size.height/2.0];
    return strechImage;
}

- (UIImage *)stretchableImageWithCenter {
    return [self stretchableImageWithPoint:CGPointMake(self.size.width/2, self.size.height/2)];
}

- (UIImage *)stretchableImageWithPoint:(CGPoint)point {
    UIEdgeInsets inset = UIEdgeInsetsMake(point.y-1, point.x-1, self.size.height-point.y, self.size.width-point.x);
    return [self stretchableImageWithEdgeInsets:inset];
}

- (UIImage *)stretchableImageWithEdgeInsets:(UIEdgeInsets)insets {
    @autoreleasepool {
        UIImage *stretchImg = nil;
        if ([self respondsToSelector:@selector(resizableImageWithCapInsets:resizingMode:)]) {
            stretchImg = [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        } else if ([self respondsToSelector:@selector(stretchableImageWithLeftCapWidth:topCapHeight:)]) {
            stretchImg = [self stretchableImageWithLeftCapWidth:insets.left topCapHeight:insets.top];
        }
        return stretchImg;
    }
}

@end
