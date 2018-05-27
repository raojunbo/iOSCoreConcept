//
//  NSString+KB_Verification.h
//  RapidCalculation
//
//  Created by lihui on 2017/12/28.
//  Copyright © 2017年 knowin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KBIsBlankString(str)  [NSString kb_isBlankString:str]
#define KBIsPureInt(str)  [NSString kb_isPureInt:str]
#define KBIsPureFloat(str)  [NSString kb_isPureFloat:str]

@interface NSString (KB_Verification)

/**
 判断 字符串是否为空: 3 种情况
 1 >> 是否为nil
 2 >> 是否是NSNull
 3 >> 是否去掉空格之后长度为0

 @return <#return value description#>
 */
+ (BOOL)kb_isBlankString:(NSString *)aStr;

/// 判断是否为整形
+ (BOOL)kb_isPureInt:(NSString *)aStr;
/// 判断是否为浮点数
+ (BOOL)kb_isPureFloat:(NSString *)aStr;

@end
