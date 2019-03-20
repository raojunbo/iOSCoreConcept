//
//  CoreTextView.h
//  CoreConcept
//
//  Created by rjb on 2019/3/17.
//  Copyright © 2019 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreRichTextData.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreTextView : UIView
@property (nonatomic, strong) CoreRichTextData *richTextData;
@end

NS_ASSUME_NONNULL_END
