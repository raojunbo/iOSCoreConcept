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

@protocol CoreItemPotocal <NSObject>
@property (nonatomic, strong) NSMutableArray *runFrames;//一个句子，可能被截断成多个run
@property (nonatomic, strong) NSAttributedString *attributesStr;

@end

@interface CoreBaseItem:NSObject<CoreItemPotocal>
@property (nonatomic, strong) NSMutableArray *runFrames;
@property (nonatomic, strong) NSAttributedString *attributesStr;
@end

@interface CoreLinkItem : CoreBaseItem
@property (nonatomic, strong) NSAttributedString *linkAttributesText;
@end

@interface CoreImageItem : CoreBaseItem
@property (nonatomic, strong) UIImage *image;
@end

@interface CoreTextItem : CoreBaseItem
@property (nonatomic, strong) NSAttributedString *normalAttributesText;
@end


@interface CoreRichTextData : NSObject
@property (nonatomic, assign)CGRect textBounds;               //段落需要要
@property (nonatomic, assign,readonly)CTFrameRef frameRef;    //排好版的CTFrame
@property (nonatomic, strong,readonly)NSArray *sentenceArray; //句子数组

- (instancetype)initWithSentenceArray:(NSArray <id<CoreItemPotocal>> *)sentenceArray;

- (void)calculateImagePosition;

@end

NS_ASSUME_NONNULL_END
