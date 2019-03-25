//
//  CoreRichTextView.m
//  CoreConcept
//
//  Created by rjb on 2019/3/17.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "CoreRichTextView.h"

@interface CoreRichTextView ()

@end

@implementation CoreRichTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
       
    }
    return self;
}

- (void)setRichTextData:(CoreRichTextData *)richTextData {
    _richTextData = richTextData;
    _richTextData.textBounds = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

//真正的绘制
- (void)drawRect:(CGRect)rect {
    
    //1. 清空上面的所有view
    //2. 绘制frameRef
    //3. 绘制图片
    //4. 添加输入框
    
    //取得绘制的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();//取得当前的上下文
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);//去掉文本锯齿
    CGContextTranslateCTM(context, 0, self.bounds.size.height);//转换坐标系
    CGContextScaleCTM(context, 1, -1);
    
    //将文本绘制上
    CTFrameDraw(self.richTextData.frameRef, context);
    
    //将图片绘制上
    for (int i = 0; i < self.richTextData.sentenceArray.count; i++) {
        CoreBaseItem *item = self.richTextData.sentenceArray[i];
        //绘制图片
        if ([item isKindOfClass:[CoreImageItem class]]) {
            CoreImageItem *imageItem = (CoreImageItem *)item;
            for (int j = 0; j < imageItem.runFrames.count; j++) {
                CGRect frame = [imageItem.runFrames[j] CGRectValue];
                CGContextDrawImage(context, frame, imageItem.image.CGImage);
            }
        }
    }
    [self addUIKitView];
}

- (void)addUIKitView {
    for (UIView *sub in self.subviews) {
        [sub removeFromSuperview];
    }
    //添加空格视图
    for (int i = 0; i < self.richTextData.sentenceArray.count; i++) {
        CoreBaseItem *item = self.richTextData.sentenceArray[i];
        if ([item isKindOfClass:[CoreFillInItem class]]) {
            CoreFillInItem *fillItem = (CoreFillInItem *)item;
            for (int j = 0; j < fillItem.uiKitFrames.count; j++) {
                CGRect frame = [fillItem.uiKitFrames[j] CGRectValue];
                fillItem.textFiledView.frame = frame;
                [self addSubview:fillItem.textFiledView];
             }
         }
     }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = event.allTouches.anyObject;
    CGPoint point = [touch locationInView:touch.view];

    for (int i = 0; i < self.richTextData.sentenceArray.count; i++) {
        CoreBaseSeatItem *item =  (CoreBaseSeatItem *)self.richTextData.sentenceArray[i];
        if([item isKindOfClass:[CoreLinkItem class]]){
            for (int j = 0;j< item.uiKitFrames.count;j++ ) {
                CGRect frame = [item.uiKitFrames[j] CGRectValue];
                if(CGRectContainsPoint(frame, point)){
                    NSLog(@"哈哈，找到点击了链接");
                }
            }
        }else if([item isKindOfClass:[CoreImageItem class]]){
            for (int j = 0;j< item.uiKitFrames.count;j++ ) {
                CGRect frame = [item.uiKitFrames[j] CGRectValue];
                if(CGRectContainsPoint(frame, point)){
                    NSLog(@"哈哈，找到点击了图片");
                }
            }
        }
    }
}

//重写sizeThatFits方法,当外部使用frame布局时，通过sizeToFit
//这里实际上计算的是有问题的的?
- (CGSize)sizeThatFits:(CGSize)size {
    NSAttributedString *drawString = self.richTextData.assembleAttributesString;
    if (drawString == nil) {
        return CGSizeZero;
    }
    CFAttributedStringRef attributedStringRef = (__bridge CFAttributedStringRef)drawString;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attributedStringRef);//排版器
    CFRange range = CFRangeMake(0, 0);
    if (self.numberOfLines > 0 && framesetter) {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, CGRectMake(0, 0, size.width, size.height));
        CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
        CFArrayRef lines = CTFrameGetLines(frame);//排版完全之后的所有行
        if (lines !=nil && CFArrayGetCount(lines) > 0) {
            NSInteger lastVisibleLineIndex = MIN(self.numberOfLines, CFArrayGetCount(lines)) -1;
            CTLineRef lastVisibleLine = CFArrayGetValueAtIndex(lines, lastVisibleLineIndex);//获取可见范围的最后一行
            CFRange rangeToLayout = CTLineGetStringRange(lastVisibleLine);
            range = CFRangeMake(0, rangeToLayout.location + rangeToLayout.length);
        }
        CFRelease(frame);
        CFRelease(path);
    }
    
    //计算出真正的大小
    CFRange fitCFRange = CFRangeMake(0, 0);
    CGSize newSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, range, NULL, size, &fitCFRange);

    return newSize;
}

@end
