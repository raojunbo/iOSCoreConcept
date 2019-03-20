//
//  CoreRichTextData.h
//  CoreConcept
//
//  Created by rjb on 2019/3/18.
//  Copyright © 2019 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

NS_ASSUME_NONNULL_BEGIN

//可以将一段文本解析成一个一个的item项目：linkItem,imageItem


typedef NS_ENUM(NSInteger, CoreItemType) {
    CoreItemTextType = 0,
    CoreItemLinkType = 1,
    CoreItemImageType = 2,
    CoreItemFillInType = 3
};

@protocol CoreItemPotocal <NSObject>
@property (nonatomic, strong) NSMutableArray *runFrames;//一个句子，可能被截断成多个run,coreText坐标
@property (nonatomic, strong) NSMutableArray *uiKitFrames;//一个句子的run坐标转换成UIKit的坐标
@property (nonatomic, strong) NSAttributedString *attributesStr;//转换完后的属性字符串
@end

@interface CoreBaseItem:NSObject<CoreItemPotocal>
@property (nonatomic, strong) NSMutableArray *runFrames;
@property (nonatomic, strong) NSMutableArray *uiKitFrames;
@property (nonatomic, strong) NSAttributedString *attributesStr;
@end

@interface CoreTextItem : CoreBaseItem
@property (nonatomic, strong) NSAttributedString *normalAttributesText;
@end

@interface CoreLinkItem : CoreBaseItem
@property (nonatomic, strong) NSAttributedString *linkAttributesText;
@end

//带占位符号，需要设置代理改变占位大小
@interface CoreBaseSeatItem : CoreBaseItem
@property (nonatomic, assign) CGSize seatSize;
@end

@interface CoreImageItem : CoreBaseSeatItem
@property (nonatomic, strong) UIImage *image;
@end

@interface CoreFillInItem : CoreBaseSeatItem
@property (nonatomic, strong) UITextField *textFiledView;
@end

@interface CoreRichTextData : NSObject
@property (nonatomic, assign)CGRect textBounds;               //排版路径
@property (nonatomic, strong,readonly) NSArray *sentenceArray; //句子数组
@property (nonatomic, assign,readonly) CTFrameRef frameRef;    //排好版的CTFrame
@property (nonatomic, strong,readonly) NSMutableAttributedString *assembleAttributesString;//将图片组装完成后的属性字符串

- (instancetype)initWithSentenceArray:(NSArray <id<CoreItemPotocal>> *)sentenceArray;

- (void)calculateImagePosition;

@end

NS_ASSUME_NONNULL_END
