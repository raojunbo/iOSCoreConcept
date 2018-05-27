//
//  NSString+KB_Extension.h
//  KBFoundation
//
//  Created by WangYouming on 2018/3/12.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KB_Extension)
- (BOOL)kb_isPhoneNumber;
- (NSString *)kb_urlEncode;
//- (NSString *)kb_urlDecode;
@end
