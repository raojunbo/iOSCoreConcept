//
//  NSString+KB_MD5.m
//  
//
//  Created by AJMD on 16/11/18.
//  Copyright © 2016年 AJMD. All rights reserved.
//

#import "NSString+KB_MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (KB_MD5)

- (NSString *)kb_md5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_LONG length = (CC_LONG)strlen(cStr);
    CC_MD5(cStr,length, result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
    
@end
