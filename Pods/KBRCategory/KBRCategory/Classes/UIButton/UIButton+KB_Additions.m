//
//  UIButton+SimAdditions.m
//  piano
//
//  Created by Liu Xubin on 13-9-7.
//  Copyright (c) 2013年 Liu Xubin. All rights reserved.
//

#import "UIButton+KB_Additions.h"
#import <objc/runtime.h>


@implementation UIButton (KB_Additions)


+ (instancetype)btnWithImageNames:(NSArray *)imageNames{
    return [self btnWithImageNames:imageNames btnSize:CGSizeMake(0, 0) isBackgroud:NO];
}

// 指定按钮的size
+ (instancetype)btnWithImageNames:(NSArray *)imageNames btnSize:(CGSize)btnSize{
    return [self btnWithImageNames:imageNames btnSize:btnSize isBackgroud:NO];
}

+ (instancetype)btnWithImageNames:(NSArray *)imageNames isBackgroud:(BOOL)isBackgroud{
    return [self btnWithImageNames:imageNames btnSize:CGSizeMake(0, 0) isBackgroud:isBackgroud];
}

+ (instancetype)btnWithImageNames:(NSArray *)imageNames btnSize:(CGSize)btnSize isBackgroud:(BOOL)isBackgroud{
    
    UIButton *btn = nil;
    if (imageNames.count > 0) {
        UIImage *btnImage = [UIImage imageNamed:[imageNames objectAtIndex:0]];
        if (btnSize.width == 0) {
            btnSize.width = btnImage.size.width;
        }
        if (btnSize.height == 0){
            btnSize.height = btnImage.size.height;
        }
        
        btn = [[self alloc] initWithFrame:CGRectMake(0, 0, btnSize.width, btnSize.height)];
        if (isBackgroud) {
            [btn setBackgroundImage:btnImage forState:UIControlStateNormal];
        }
        else{
            [btn setImage:btnImage forState:UIControlStateNormal];
        }
        for (int i = 1; i < imageNames.count; i++) {
            NSString *imageName = [imageNames objectAtIndex:i];
            if (imageName.length > 0) {
                UIControlState state =  UIControlStateHighlighted << (i-1);
                if (isBackgroud) {
                    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:state];
                }
                else{
                    [btn setImage:[UIImage imageNamed:imageName] forState:state];
                }
            }
        }
    }
    
    return btn;
}

- (void)setBackgroundImageByColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    
    // tcv - temporary colored view
    UIView *tcv = [[UIView alloc] initWithFrame:self.frame];
    [tcv setBackgroundColor:backgroundColor];
    
    // set up a graphics context of button's size
    CGSize gcSize = tcv.frame.size;
    UIGraphicsBeginImageContext(gcSize);
    // add tcv's layer to context
    [tcv.layer renderInContext:UIGraphicsGetCurrentContext()];
    // create background image now
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // set image as button's background image for the given state
    [self setBackgroundImage:image forState:state];
    UIGraphicsEndImageContext();
    
    // ensure rounded button
    self.clipsToBounds = YES;
}

static char kSimUIButtoBtnClickPrivateKey;
- (void)handleClickEventBlock:(void (^)(UIButton *))block
{
    [self handleClick:UIControlEventTouchUpInside block:block];
}

- (void)handleClick:(UIControlEvents)event block:(void (^)(UIButton *))block
{
    [self addTarget:self action:@selector(dealBtnClick:) forControlEvents:event];
    objc_setAssociatedObject(self, &kSimUIButtoBtnClickPrivateKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)dealBtnClick:(UIButton *)btn
{
    void (^block)(UIButton *)  = objc_getAssociatedObject(self, &kSimUIButtoBtnClickPrivateKey);
    if (block) {
        block(btn);
    }    
}

//UserInfo
static char kSimUIButtonUserInfoPrivateKey;

- (void)setUserInfo:(id)userInfo
{
    objc_setAssociatedObject(self, &kSimUIButtonUserInfoPrivateKey, userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)userInfo
{
    return objc_getAssociatedObject(self, &kSimUIButtonUserInfoPrivateKey);
}

@end
