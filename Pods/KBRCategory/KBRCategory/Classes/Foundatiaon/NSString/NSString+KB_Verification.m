//
//  NSString+KB_Verification.m
//  RapidCalculation
//
//  Created by lihui on 2017/12/28.
//  Copyright © 2017年 knowin. All rights reserved.
//

#import "NSString+KB_Verification.h"

@implementation NSString (KB_Verification)

+ (BOOL)kb_isBlankString:(NSString *)aStr
{
    NSString *string = aStr;
    if (nil == string || NULL == string)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if (0 == [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length])
    {
        return YES;
    }
    
    return NO;
}

+ (BOOL)kb_isPureInt:(NSString *)aStr
{
    NSScanner* scan = [NSScanner scannerWithString:aStr];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (BOOL)kb_isPureFloat:(NSString *)aStr
{
    NSScanner* scan = [NSScanner scannerWithString:aStr];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

@end
