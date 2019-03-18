//
//  CoreTextView2.m
//  CoreConcept
//
//  Created by rjb on 2019/3/17.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "CoreTextView2.h"

@interface CoreTextView2 ()
@property (nonatomic, strong) CoreRichTextData *richTextData;
@end

@implementation CoreTextView2

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        //测试数据
        
        UIFont *linkFont = [UIFont systemFontOfSize:15];
        NSDictionary *linkAttributes = @{NSFontAttributeName:linkFont,NSForegroundColorAttributeName:[UIColor redColor]};
        
        //链接
        //图片
        //文本
        
        CoreLinkItem *linkItem = [[CoreLinkItem alloc]init];
        linkItem.linkAttributesText = [[NSAttributedString alloc]initWithString:@"www.baidu.com.baidu.c" attributes:linkAttributes];
        
        CoreImageItem *imageItem = [[CoreImageItem alloc]init];
        imageItem.image = [UIImage imageNamed:@"text2"];
        
        UIFont *normalFont = [UIFont systemFontOfSize:15];
        NSDictionary *normalAttributes = @{NSFontAttributeName:normalFont,NSForegroundColorAttributeName:[UIColor blackColor]};
        

        CoreTextItem *textItem  = [[CoreTextItem alloc]init];
        textItem.normalAttributesText = [[NSAttributedString alloc]initWithString:@"墨及周年" attributes:normalAttributes];
        
        NSArray *array = @[linkItem,imageItem,textItem];
        
        _richTextData = [[CoreRichTextData alloc]initWithSentenceArray:array];
        _richTextData.textBounds = CGRectMake(0, 0, frame.size.width, frame.size.height);//需要渲染到哪个frame里
    }
    return self;
}

//真正的绘制
- (void)drawRect:(CGRect)rect {
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
        
        if ([item isKindOfClass:[CoreImageItem class]]) {
            CoreImageItem *imageItem = (CoreImageItem *)item;
//            if(imageItem.runFrames.count > 0){
                for (int j = 0; j < imageItem.runFrames.count; j++) {
                    CGRect frame = [imageItem.runFrames[j] CGRectValue];
                    CGContextDrawImage(context, frame, imageItem.image.CGImage);
                }
//            }
        }
    }
    
}

@end
