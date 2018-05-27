//
//  UIImage+KB_Extension.m
//  KBFoundation
//
//  Created by WangYouming on 2018/3/12.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import "UIImage+KB_Extension.h"

@implementation UIImage (KB_Extension)

+ (UIImage *)kb_imageWithPathName:(NSString *)pathName {
    if (pathName.pathExtension.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:pathName ofType:nil];
        return [[UIImage alloc] initWithContentsOfFile:path];
    }
    
    if ([pathName hasSuffix:@"@2x"] || [pathName hasSuffix:@"@3x"]) {
        NSString *pngPath = [pathName stringByAppendingPathExtension:@"png"];
        NSString *absPngPath = [[NSBundle mainBundle] pathForResource:pngPath ofType:nil];
        if (absPngPath.length > 0) {
            return [[UIImage alloc] initWithContentsOfFile:absPngPath];
        }
        NSString *jpgPath = [pathName stringByAppendingPathExtension:@"jpg"];
        NSString *absJpgPath = [[NSBundle mainBundle] pathForResource:jpgPath ofType:nil];
        if (absJpgPath.length > 0) {
            return [[UIImage alloc] initWithContentsOfFile:absJpgPath];
        }
        return nil;
    }
    NSString *path = [pathName stringByAppendingString:@"@2x.png"];
    path = [[NSBundle mainBundle] pathForResource:path ofType:nil];
    if (path.length > 0) {
        return [[UIImage alloc] initWithContentsOfFile:path];
    }
    return nil;
}


+ (UIImage *)kb_imageFromContentFile:(NSString *)pathName
{
    NSString *filePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:[pathName stringByAppendingPathExtension:@"png"]];
    return [UIImage imageWithContentsOfFile:filePath];
}


@end
