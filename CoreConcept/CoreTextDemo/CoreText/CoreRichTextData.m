//
//  CoreRichTextData.m
//  CoreConcept
//
//  Created by rjb on 2019/3/18.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "CoreRichTextData.h"


static  NSString * const kCoreExtraDataAttributeTypeKey = @"kCoreExtraDataAttributeTypeKey";

@implementation CoreBaseItem

- (instancetype)init {
    if(self = [super init]){
        _runFrames = [[NSMutableArray alloc]init];
        _uiKitFrames = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSAttributedString *)attributesStr{
    return nil;
}

- (NSAttributedString *)configAttributes:(NSAttributedString *)atrStr withExtraData:(CoreItemType)itemType {
    NSMutableAttributedString *toConfigAttributesStr = [[NSMutableAttributedString alloc]initWithAttributedString:atrStr];
    NSDictionary *extraData = @{@"key": @(itemType),
                                @"value": self
                                };
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)toConfigAttributesStr, CFRangeMake(0, toConfigAttributesStr.length), (CFStringRef)kCoreExtraDataAttributeTypeKey, (__bridge CFTypeRef)(extraData));
    return [toConfigAttributesStr copy];
}

@end

@implementation CoreTextItem

- (NSAttributedString *)attributesStr{
    return [self configAttributes:self.normalAttributesText withExtraData:CoreItemTextType];
}

@end

@implementation CoreLinkItem

- (NSAttributedString *)attributesStr {
     return [self configAttributes:self.linkAttributesText withExtraData:CoreItemLinkType];
}

@end

@implementation CoreBaseSeatItem

- (NSAttributedString *)attributesDelegateStr {
    CTRunDelegateCallbacks callback;
    memset(&callback, 0, sizeof(callback));//将callback初始化为0
    callback.getAscent = getAscent;
    callback.getDescent = getDescent;
    callback.getWidth = getWidth;
    
    //给图片run设置CTRunDelegateRef，让其在布局时通过代理方法获取run的大小
    NSDictionary *metaData = @{@"width":@(self.seatSize.width),@"height":@(self.seatSize.height)};
    CTRunDelegateRef runDelegate = CTRunDelegateCreate(&callback, (__bridge_retained void *)(metaData));
    
    //设置空白符号表示图片占位符号
    unichar objectReplacementChar = 0xFFFC;
    NSMutableAttributedString *imagePlaceHolderAttributeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithCharacters:&objectReplacementChar length:1] ];
    //给这个空白符号属性字符串添加属性，其中有一个RunDelegate的属性
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)imagePlaceHolderAttributeString, CFRangeMake(0, 1), kCTRunDelegateAttributeName, runDelegate);
    
    CFRelease(runDelegate);
    return imagePlaceHolderAttributeString;
}

- (NSAttributedString *)attributesStr{
    NSAttributedString *delegateAttStr = [self attributesDelegateStr];
    NSAttributedString *relAttStr = [self configAttributes:delegateAttStr withExtraData:CoreItemFillInType];
    return relAttStr;
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
@end

@implementation CoreImageItem

- (CGSize)seatSize {
    return self.image.size;
}

//图片属性字符
- (NSAttributedString *)attributesStr{
    return [self configAttributes:[self attributesDelegateStr] withExtraData:CoreItemImageType];
}

@end


@implementation CoreFillInItem

- (CGSize)seatSize {
    return self.textFiledView.frame.size;
}

//带输入框的
- (NSAttributedString *)attributesStr {
    return [self configAttributes:[self attributesDelegateStr] withExtraData:CoreItemFillInType];
}

@end
@interface CoreRichTextData ()

@property (nonatomic, strong) NSMutableAttributedString *assembleAttributesString;//将图片组装完成后的属性字符串
@end

@implementation CoreRichTextData
- (instancetype)initWithSentenceArray:(NSArray *)sentenceArray {
    if(self = [super init]){
        _sentenceArray = sentenceArray;
        _assembleAttributesString = [[NSMutableAttributedString alloc]init];
        [self arrangementAssembleAttributesString];
    }
    return self;
}

- (void)setTextBounds:(CGRect)textBounds {
    _textBounds = textBounds;
    [self calculateImagePosition];
}

- (void)calculateImagePosition {
    //获取所有的列
    NSArray *lines = (NSArray *)CTFrameGetLines(self.frameRef);
    if (lines == 0) {
        return;
    }

    CGPoint lineOrigins[lines.count];
    CTFrameGetLineOrigins(self.frameRef, CFRangeMake(0, 0), lineOrigins);
    for (int i = 0; i<lines.count; i++) {
        CTLineRef line = (__bridge CTLineRef)lines[i];
        //获取每一行的runs
        NSArray *runs = (NSArray *)CTLineGetGlyphRuns(line);
        for (int j = 0; j< runs.count; j++) {
            CTRunRef run = (__bridge CTRunRef)runs[j];
            
            //每一个run的属性,从run中获取先前保存的信息
            NSDictionary *attributes = (NSDictionary *)CTRunGetAttributes(run);
            if(!attributes){
                continue;
            }
            
            //获取当前run的位置
            NSDictionary *extraData = (NSDictionary *)[attributes valueForKey:kCoreExtraDataAttributeTypeKey];
            if(extraData){
               id<CoreItemPotocal>  item = [extraData valueForKey:@"value"];//对象
                if (item == nil) {
                    continue;
                }
                if ([item isKindOfClass:[CoreTextItem class]]) {
                    NSLog(@"这是普通文本");
                }else if([item isKindOfClass:[CoreLinkItem class]]){//返回的坐标是uikit坐标（左上为起点）
                    NSLog(@"这是链接");
                }else if([item isKindOfClass:[CoreImageItem class]]){//返回的坐标是CoreText(左下为起点)
                    NSLog(@"这是图片");
                }
                CGFloat ascent;
                CGFloat desent;
                CGFloat width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &desent, NULL);
                CGFloat height = ascent + desent;
                
                CGFloat xOffset = lineOrigins[i].x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
                CGFloat yOffset = lineOrigins[i].y;
                
                //coreText坐标
                CGRect ctClickableFrame = CGRectMake(xOffset, yOffset, width, height);
                
                //将CoreText坐标转换为UIKit坐标
                CGRect uiKitClickableFrame = CGRectMake(xOffset, self.textBounds.size.height - yOffset - ascent, width, height);
                
                [item.uiKitFrames addObject:[NSValue valueWithCGRect:uiKitClickableFrame]];
                [item.runFrames addObject:[NSValue valueWithCGRect:ctClickableFrame]];
            }
        }
    }
}

- (void)arrangementAssembleAttributesString {
    for (int i = 0; i< self.sentenceArray.count; i++) {
        id<CoreItemPotocal>  item = self.sentenceArray[i];
        if([item conformsToProtocol:@protocol(CoreItemPotocal)] && item.attributesStr!=nil){
            [self.assembleAttributesString appendAttributedString:item.attributesStr];
        }
    }
}

- (CTFrameRef)frameRef {
    //排版的路径范围
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.textBounds);
    
    //创建排版器，
    CTFramesetterRef setter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef) self.assembleAttributesString);

    //在指定的路径里，排版哪些范围的字符
    CTFrameRef frame = CTFramesetterCreateFrame(setter, CFRangeMake(0, self.assembleAttributesString.length), path, NULL);
    return frame;
}


@end
