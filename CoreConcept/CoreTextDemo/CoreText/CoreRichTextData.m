//
//  CoreRichTextData.m
//  CoreConcept
//
//  Created by rjb on 2019/3/18.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "CoreRichTextData.h"

//可以将一段文本解析成一个一个的item项目：linkItem,imageItem

static  NSString * const kCoreExtraDataAttributeTypeKey = @"kCoreExtraDataAttributeTypeKey";

typedef NS_ENUM(NSInteger, CoreItemType) {
    CoreItemTextType = 0,
    CoreItemImageType = 1,
    CoreItemLinkType = 2
};

@implementation CoreBaseItem

- (instancetype)init {
    if(self = [super init]){
        _runFrames = [[NSMutableArray alloc]init];
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

@implementation CoreLinkItem

- (NSAttributedString *)attributesStr {
     return  [self configAttributes:self.linkAttributesText withExtraData:CoreItemLinkType];
}

@end


@implementation CoreImageItem

//图片属性字符
- (NSAttributedString *)attributesStr{
    CTRunDelegateCallbacks callback;
    memset(&callback, 0, sizeof(callback));//将callback初始化为0
    callback.getAscent = getAscent;
    callback.getDescent = getDescent;
    callback.getWidth = getWidth;
    
    //给图片run设置CTRunDelegateRef，让其在布局时通过代理方法获取run的大小
    NSDictionary *metaData = @{@"width":@(self.image.size.width),@"height":@(self.image.size.height)};
    CTRunDelegateRef runDelegate = CTRunDelegateCreate(&callback, (__bridge_retained void *)(metaData));
    
    //设置空白符号表示图片占位符号
    unichar objectReplacementChar = 0xFFFC;
    NSMutableAttributedString *imagePlaceHolderAttributeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithCharacters:&objectReplacementChar length:1] ];
    //给这个空白符号属性字符串添加属性，其中有一个RunDelegate的属性
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)imagePlaceHolderAttributeString, CFRangeMake(0, 1), kCTRunDelegateAttributeName, runDelegate);
    
    NSAttributedString *relAttStr = [self configAttributes:imagePlaceHolderAttributeString withExtraData:CoreItemImageType];
    
    CFRelease(runDelegate);
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

@implementation CoreTextItem

- (NSAttributedString *)attributesStr{
    return [self configAttributes:self.normalAttributesText withExtraData:CoreItemTextType];
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
                }else if([item isKindOfClass:[CoreLinkItem class]]){
                    NSLog(@"这是链接");
                }else if([item isKindOfClass:[CoreImageItem class]]){
                    NSLog(@"这是图片");
                }
                CGFloat ascent;
                CGFloat desent;
                CGFloat width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &desent, NULL);
                
                //当前run的起始位置 = 当前行的起始位置 + 当前run的location。
                CGFloat xOffset = lineOrigins[i].x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
                CGFloat yOffset = lineOrigins[i].y;
            
                [item.runFrames addObject:[NSValue valueWithCGRect:CGRectMake(xOffset, yOffset, width, ascent + desent)]];
            
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
