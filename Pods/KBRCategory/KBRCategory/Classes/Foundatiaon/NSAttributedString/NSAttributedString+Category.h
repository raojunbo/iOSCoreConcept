//
//  NSAttributedString+Category.h
//  RapidCalculation
//
//  Created by HuanWang on 5/20/15.
//  Copyright (c) 2016 KnowBox. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSAttributedString (Category)

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font;

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font
                                 textColor:(UIColor *)textColor;

+ (instancetype)attributedStringWithString:(NSString *)string
									  font:(UIFont *)font
								 textColor:(UIColor *)textColor
							 lineBreakMode:(NSLineBreakMode)lineBreakMode;

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font
                                 textColor:(UIColor *)textColor
                             textAlignment:(NSTextAlignment)textAlignment;

+ (instancetype)attributedStringWithString:(NSString *)string
									  font:(UIFont *)font
								 textColor:(UIColor *)textColor
							 textAlignment:(NSTextAlignment)textAlignment
							 lineBreakMode:(NSLineBreakMode)lineBreakMode;

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font
                                 textColor:(UIColor *)textColor
                             textAlignment:(NSTextAlignment)textAlignment
                          paragraghSpacing:(CGFloat)paragraghSpacing;

+ (instancetype)attributedStringWithString:(NSString *)string
                                      font:(UIFont *)font
                                 textColor:(UIColor *)textColor
                             textAlignment:(NSTextAlignment)textAlignment
                          paragraghSpacing:(CGFloat)paragraghSpacing
                               lineSpacing:(CGFloat)lineSpacing;

+ (instancetype)attributedStringWithString:(NSString *)string
									  font:(UIFont *)font
								 textColor:(UIColor *)textColor
							 textAlignment:(NSTextAlignment)textAlignment
					paragraphSpacingBefore:(CGFloat)paragraphSpacingBefore
						  paragraghSpacing:(CGFloat)paragraghSpacing
							   lineSpacing:(CGFloat)lineSpacing;

+(instancetype)attributesStringWithImageAttach:(UIImage *)image
                                          size:(CGRect) rect;
- (CGFloat)boundingHeightForMaxWidth:(CGFloat)width;

- (CGFloat)boundingWidth;

- (CGSize)boundingSize;

// 通过缩小字体使得AttributedString的宽在maxWidth内
+ (NSAttributedString *)properAttributedStringWithMaxWidth:(CGFloat)maxWidth
                                                      step:(CGFloat)step
                                     attributedStringBlock:(NSAttributedString *(^)(UIFont *font))attributedBlock;

+ (UIFont *)properFontForAttributedStringWithMaxWidth:(CGFloat)maxWidth
                                                 step:(CGFloat)step
                                attributedStringBlock:(NSAttributedString *(^)(UIFont *font))attributedBlock;

- (void)debugAttributes;

@end
