//
//  NSAttributedString+Category.m
//  RapidCalculation
//
//  Created by HuanWang on 5/20/15.
//  Copyright (c) 2016 KnowBox. All rights reserved.
//

#import "NSAttributedString+Category.h"

@implementation NSAttributedString (Category)

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font
{
    NSAttributedString *attrText = nil;
    
    if (string && font) {
        attrText = [[NSAttributedString alloc] initWithString:string
                                        attributes:@{
                                                     NSFontAttributeName : font
                                                     }];
    }
    return attrText;
}

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font
                                 textColor:(UIColor *)textColor
{
    NSAttributedString *attrText = nil;
    
    if (string && font && textColor) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        
        attrText = [[NSAttributedString alloc] initWithString:string
                                                   attributes:@{
                                                                NSFontAttributeName : font,
                                                                NSForegroundColorAttributeName : textColor,
                                                                NSParagraphStyleAttributeName : paragraphStyle,
                                                                }];
    }
    return attrText;
}

+ (instancetype)attributedStringWithString:(NSString *)string
									  font:(UIFont *)font
								 textColor:(UIColor *)textColor
							 lineBreakMode:(NSLineBreakMode)lineBreakMode
{
	if (string && font && textColor) {
		NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
		paragraphStyle.lineBreakMode = lineBreakMode;
		
		return
		[[NSAttributedString alloc] initWithString:string
										attributes:@{
													 NSFontAttributeName : font,
													 NSForegroundColorAttributeName : textColor,
													 NSParagraphStyleAttributeName : paragraphStyle,
													 }];
	} else {
		return nil;
	}
}

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font
                                 textColor:(UIColor *)textColor
                             textAlignment:(NSTextAlignment)textAlignment
{
    NSAttributedString *attrText = nil;
    
    if (string && font && textColor) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = textAlignment;
        
        attrText = [[NSAttributedString alloc] initWithString:string
                                                   attributes:@{
                                                                NSFontAttributeName : font,
                                                                NSForegroundColorAttributeName : textColor,
                                                                NSParagraphStyleAttributeName : paragraphStyle,
                                                                }];
    }
    return attrText;
}

+ (instancetype)attributedStringWithString:(NSString *)string
									  font:(UIFont *)font
								 textColor:(UIColor *)textColor
							 textAlignment:(NSTextAlignment)textAlignment
							 lineBreakMode:(NSLineBreakMode)lineBreakMode
{
	if (string && font && textColor) {
		NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
		paragraphStyle.lineBreakMode = lineBreakMode;
		paragraphStyle.alignment = textAlignment;
		
		return
		[[NSAttributedString alloc] initWithString:string
										attributes:@{
													NSFontAttributeName : font,
													NSForegroundColorAttributeName : textColor,
													NSParagraphStyleAttributeName : paragraphStyle,
													}];
	} else {
		return nil;
	}
}

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font
                                 textColor:(UIColor *)textColor
                             textAlignment:(NSTextAlignment)textAlignment
                          paragraghSpacing:(CGFloat)paragraghSpacing
{
    NSAttributedString *attrText = nil;
    
    if (string && font && textColor) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = textAlignment;
        paragraphStyle.paragraphSpacing = paragraghSpacing;
        
        attrText = [[NSAttributedString alloc] initWithString:string
                                                   attributes:@{
                                                                NSFontAttributeName : font,
                                                                NSForegroundColorAttributeName : textColor,
                                                                NSParagraphStyleAttributeName : paragraphStyle,
                                                                }];
    }
    return attrText;
}

+ (instancetype)attributedStringWithString:(NSString *)string
									  font:(UIFont *)font
								 textColor:(UIColor *)textColor
							 textAlignment:(NSTextAlignment)textAlignment
						  paragraghSpacing:(CGFloat)paragraghSpacing
							   lineSpacing:(CGFloat)lineSpacing
{
	NSAttributedString *attrText = nil;
	
	if (string && font && textColor) {
		NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
		paragraphStyle.alignment = textAlignment;
		paragraphStyle.paragraphSpacing = paragraghSpacing;
		paragraphStyle.lineSpacing = lineSpacing;
		
		attrText =
		[[NSAttributedString alloc] initWithString:string
										attributes:@{
													 NSFontAttributeName : font,
													 NSForegroundColorAttributeName : textColor,
													 NSParagraphStyleAttributeName : paragraphStyle,
													 }];
	}
	return attrText;
}

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font
                                 textColor:(UIColor *)textColor
							 textAlignment:(NSTextAlignment)textAlignment
					paragraphSpacingBefore:(CGFloat)paragraphSpacingBefore
                          paragraghSpacing:(CGFloat)paragraghSpacing
                               lineSpacing:(CGFloat)lineSpacing
{
    if (string && font && textColor) {
		NSMutableAttributedString *mutableAttrText = [[NSMutableAttributedString alloc] init];
		[string enumerateSubstringsInRange:NSMakeRange(0, string.length) options:NSStringEnumerationByParagraphs
		usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
			const BOOL isFirstParagraph = 0 == enclosingRange.location;
			const BOOL isLastParagraph = string.length == NSMaxRange(enclosingRange);
			
			NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
			paragraphStyle.alignment = textAlignment;
			paragraphStyle.paragraphSpacing = isLastParagraph ? 0 : paragraghSpacing;
			paragraphStyle.paragraphSpacingBefore = isFirstParagraph ? paragraphSpacingBefore : 0;
			paragraphStyle.lineSpacing = lineSpacing;
			
			NSAttributedString *attrText =
			[[NSAttributedString alloc] initWithString:[string substringWithRange:enclosingRange]
											attributes:@{
														 NSFontAttributeName : font,
														 NSForegroundColorAttributeName : textColor,
														 NSParagraphStyleAttributeName : paragraphStyle,
														 }];
			[mutableAttrText appendAttributedString:attrText];
		}];
		return mutableAttrText;
	} else {
		return nil;
	}
}
+(instancetype)attributesStringWithImageAttach:(UIImage *)image
                                          size:(CGRect) rect{
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = rect;
    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
    return attachmentString;
}
- (CGFloat)boundingHeightForMaxWidth:(CGFloat)width
{
    CGRect rect = ([self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                      options:(NSStringDrawingUsesLineFragmentOrigin |  NSStringDrawingUsesFontLeading)
                                      context:nil]);
    
    rect = CGRectIntegral(rect);
    
    return rect.size.height;
}

- (CGFloat)boundingWidth
{
    CGRect rect = ([self boundingRectWithSize:CGSizeMake(MAXFLOAT, 1.0f)
                                      options:(NSStringDrawingUsesLineFragmentOrigin |  NSStringDrawingUsesFontLeading)
                                      context:nil]);
    rect = CGRectIntegral(rect);
    
    return rect.size.width;
}

- (CGSize)boundingSize
{
    CGRect rect = ([self boundingRectWithSize:CGSizeMake(MAXFLOAT, 1.0f)
                                      options:(NSStringDrawingUsesLineFragmentOrigin |  NSStringDrawingUsesFontLeading)
                                      context:nil]);
    rect = CGRectIntegral(rect);
    return rect.size;
}

+ (NSAttributedString *)properAttributedStringWithMaxWidth:(CGFloat)maxWidth
                                                      step:(CGFloat)step
                                     attributedStringBlock:(NSAttributedString *(^)(UIFont *font))attributedBlock
{
    NSAttributedString *attrText = nil;
    CGFloat boundingWidth = 0;
    CGFloat fontSize = 14;
    while (true) {
        attrText = attributedBlock([UIFont systemFontOfSize:fontSize]);
        boundingWidth = [attrText boundingWidth];
        if (boundingWidth <= maxWidth) {
            break;
        } else {
            fontSize -= step;
        }
    };
    return attrText;
}

+ (UIFont *)properFontForAttributedStringWithMaxWidth:(CGFloat)maxWidth
                                                 step:(CGFloat)step
                                attributedStringBlock:(NSAttributedString *(^)(UIFont *font))attributedBlock
{
    NSAttributedString *attrText = nil;
    CGFloat boundingWidth = 0;
    CGFloat fontSize = 14;
    UIFont *font = nil;
    while (true) {
        font = [UIFont systemFontOfSize:fontSize];
        attrText = attributedBlock(font);
        boundingWidth = [attrText boundingWidth];
        if (boundingWidth <= maxWidth) {
            break;
        } else {
            fontSize -= step;
        }
    };
    return font;
}

- (void)debugAttributes
{
    [self enumerateAttributesInRange:NSMakeRange(0, [self length]) options:kNilOptions usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
        NSLog(@"attrs: %@, range: %@", attrs, NSStringFromRange(range));
    }];
}

@end
