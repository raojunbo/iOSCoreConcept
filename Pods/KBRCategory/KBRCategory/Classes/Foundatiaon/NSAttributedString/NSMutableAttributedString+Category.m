//
//  NSMutableAttributedString+Category.m
//  RapidCalculation
//
//  Created by Huan WANG on 06/09/2017.
//  Copyright © 2017 knowin. All rights reserved.
//

#import "NSMutableAttributedString+Category.h"

@implementation NSMutableAttributedString (Category)

- (void)appendAttributedTexts:(NSArray<NSAttributedString *> *)attributedTexts
{
	for (NSAttributedString *attrText in attributedTexts) {
		[self appendAttributedString:attrText];
	}
}

@end
