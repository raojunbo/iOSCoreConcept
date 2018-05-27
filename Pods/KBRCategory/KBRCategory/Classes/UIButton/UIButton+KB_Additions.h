//
//  UIButton+SimAdditions.h
//
//  Created by Liu Xubin on 13-9-7.
//  Copyright (c) 2013年 Liu Xubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KB_Additions)

+ (instancetype)btnWithImageNames:(NSArray *)imageNames;
+ (instancetype)btnWithImageNames:(NSArray *)imageNames btnSize:(CGSize)btnSize;
+ (instancetype)btnWithImageNames:(NSArray *)imageNames isBackgroud:(BOOL)isBackgroud;

- (void)setBackgroundImageByColor:(UIColor *)backgroundColor forState:(UIControlState)state;

- (void)handleClickEventBlock:(void (^)(UIButton *))block;
- (void)handleClick:(UIControlEvents)event block:(void (^)(UIButton *))block;


@property (nonatomic, strong) id userInfo;

@end
