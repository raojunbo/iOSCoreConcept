//
//  BezierView.m
//  testdown
//
//  Created by rjb on 2017/12/14.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "BezierView.h"
#import <CoreText/CoreText.h>

@implementation BezierView


- (void)drawRect:(CGRect)rect {
   
   
    [[UIColor redColor] set];
//    bezierPath.bounds
//    [bezierPath stroke]
    //BezierPathFromString(@"",[UIFont systemFontOfSize:12]);
    
}

UIBezierPath *bezierPathFromString(NSString * string,UIFont *font){
    
    //创建path
    UIBezierPath *path =[UIBezierPath bezierPath];
    if (!string.length) {
        return path;
    }
    
    //create Font
    CTFontRef fonRef = CTFontCreateWithName((__bridge CFStringRef)font.fontName,font.pointSize,NULL);
    if (fonRef == NULL) {
        return nil;
    }
    
    //分配CGGlyph的数组
    //转化object的字符串转化成c的字符串
    CGGlyph *glyphs  = malloc(sizeof(CGGlyph) *string.length);
    const unichar *chars = (const unichar *)[string cStringUsingEncoding:NSUnicodeStringEncoding];
    
    BOOL success = CTFontGetGlyphsForCharacters(fonRef, chars, glyphs, string.length);
    if (!success) {
        CFRelease(fonRef);
        free(glyphs);
    }
    for (int i = 0;i< string.length;i++){
        CGGlyph glypth = glyphs[i];
        CGPathRef pathRef = CTFontCreatePathForGlyph(fonRef, glypth, NULL);
//        [path appendPath:[UIBezierPath bezierPathWithCGPath:pathRef];
        
    }
    return path;
}


@end
