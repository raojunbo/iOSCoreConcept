//
//  CoreTextView2.m
//  CoreConcept
//
//  Created by rjb on 2019/3/17.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "CoreTextView2.h"
#import <CoreText/CoreText.h>

@interface CoreRichTextData : NSObject
@property (nonatomic, strong)NSMutableArray *imagesArray;//图片数组
@property (nonatomic, strong)NSMutableAttributedString *attributesString;//属性字符串
@property (nonatomic, assign)CGRect textBounds;

@property (nonatomic, assign)CTFrameRef frameRef;

@end

@implementation CoreRichTextData

- (NSMutableArray *)imagesArray {
    if(!_imagesArray){
        _imagesArray = [[NSMutableArray alloc]init];
        [_imagesArray addObject:[UIImage imageNamed:@"text1"]];
    }
    return _imagesArray;
}

- (void)calculateImagePosition {
    
}

- (NSAttributedString *)imageAttributeString {
    CTRunDelegateCallbacks callback;
    memset(&callback, 0, sizeof(callback));//将callback初始化为0
    callback.getAscent = getAscent;
    callback.getDescent = getDescent;
    callback.getWidth = getWidth;

    NSDictionary *metaData = @{@"width":@120,@"height":@200};//图片的宽高
    //将回调方法,数据，放到代理对象里.
    CTRunDelegateRef runDelegate = CTRunDelegateCreate(&callback, (__bridge_retained void *)(metaData));

    //设置空白符号
    unichar objectReplacementChar = 0xFFFC;
    NSMutableAttributedString *imagePlaceHolderAttributeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithCharacters:&objectReplacementChar length:1] ];
    //给这个空白符号属性字符串添加属性，其中有一个RunDelegate的属性
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)imagePlaceHolderAttributeString, CFRangeMake(0, 1), kCTRunDelegateAttributeName, runDelegate);

    CFRelease(runDelegate);
    return imagePlaceHolderAttributeString;
}

static CGFloat getAscent(void *ref) {
    float height = [(NSNumber *)[(__bridge NSDictionary *)ref objectForKey:@"height"] floatValue];
    return height;
}

static CGFloat getDescent(void *ref) {
    return 0;
}

static CGFloat getWidth(void *ref) {
    float width = [(NSNumber *)[(__bridge NSDictionary *)ref objectForKey:@"width"] floatValue];
    return width;
}

- (CTFrameRef)frameRef {
    //绘制区域
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.textBounds);
    
    //绘制的内容为属性字符串
    UIFont *font = [UIFont systemFontOfSize:15];
    NSDictionary *attributes = @{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blueColor]};
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:@"hello，你好" attributes:attributes];
    [attrStr insertAttributedString:self.imageAttributeString atIndex:1];//在第二个位置插入图片
    CTFramesetterRef setter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef) attrStr);//创建排版器
    
    //在指定的路径里，排版哪些字符，用哪个排版器
    CTFrameRef frame = CTFramesetterCreateFrame(setter, CFRangeMake(0, attrStr.length), path, NULL);
    return frame;
}

@end

@interface CoreTextView2 ()
@property (nonatomic, strong) CoreRichTextData *richTextData;
@end

@implementation CoreTextView2

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        _richTextData = [[CoreRichTextData alloc]init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //取得绘制的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();//取得当前的上下文
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);//去掉文本锯齿
    CGContextTranslateCTM(context, 0, self.bounds.size.height);//转换坐标系
    CGContextScaleCTM(context, 1, -1);
    CTFrameDraw(self.richTextData.frameRef, context);
}

@end
