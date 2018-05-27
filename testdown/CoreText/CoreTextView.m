//
//  CoreTextView.m
//  testdown
//
//  Created by rjb on 2017/12/18.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "CoreTextView.h"

@implementation CoreTextView

- (void)drawRect:(CGRect)rect {
 CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)];
    NSAttributedString *attributesStr = [[NSAttributedString alloc]initWithString:@"年垃圾袋龙卷风的了解放东路解放东路附近的了发电机房朗读及分类据了解龙卷风的理解烦死了啊解放东路积分的思路分级是代理福建省六块腹肌lj"];
    drawAttributesStringBezierPath(path,attributesStr,context);
}
void drawAttributesStringBezierPath(UIBezierPath *path,NSAttributedString *attributedStr,CGContextRef context){
    //哈哈,NULL是C里的空
//
    if (context != NULL) {
        UIBezierPath *copyPath = [path copy];
        //build a framesetter and extract a frame destination
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef) attributedStr);
        CTFrameRef  theFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attributedStr.length), copyPath.CGPath, NULL);
        
        CTFrameDraw(theFrame, context);
    }
}

@end
