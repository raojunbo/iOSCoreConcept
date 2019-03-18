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
    //取得绘制的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();//取得当前的上下文
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);//转换坐标系
    CGContextScaleCTM(context, 1, -1);

    //绘制区域
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    //绘制的内容为属性字符串
    UIFont *font = [UIFont systemFontOfSize:15];
    NSDictionary *attributes = @{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blueColor]};
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:@"hello，你好" attributes:attributes];
    CTFramesetterRef setter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef) attrStr);//创建排版器
    
    //在指定的路径里，排版哪些字符，用哪个排版器
    CTFrameRef frame = CTFramesetterCreateFrame(setter, CFRangeMake(0, attrStr.length), path, NULL);
    CTFrameDraw(frame, context);
}



@end
