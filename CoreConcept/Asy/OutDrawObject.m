//
//  OutDrawObject.m
//  CoreConcept
//
//  Created by rjb on 2019/3/12.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "OutDrawObject.h"


@implementation OutDrawObject
//text2@2x
- (UIImage *)disasterMultipleWarningImgbyDwIcon:(NSString*)dwicon {
    UIImage *resultingImage = nil;
    
    NSInteger length = dwicon.length;
    NSString* colorChar;
    colorChar = [dwicon substringFromIndex:length - 1];
    UIImage *bgimg = [UIImage imageNamed:@"fire"];
    UIImage *iconImg = [UIImage imageNamed:dwicon];
    CGSize size = bgimg.size;
    UIGraphicsBeginImageContext(size);
    [bgimg drawInRect:CGRectMake(0, 0, bgimg.size.width, bgimg.size.height)];
    [iconImg drawInRect:CGRectMake(7.5, 5, bgimg.size.width-15, bgimg.size.height-15)];
    resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

@end
