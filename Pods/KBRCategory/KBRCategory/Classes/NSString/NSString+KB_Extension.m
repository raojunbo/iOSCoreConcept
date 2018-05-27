//
//  NSString+KB_Extension.m
//  KBFoundation
//
//  Created by WangYouming on 2018/3/12.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import "NSString+KB_Extension.h"

@implementation NSString (KB_Extension)

- (BOOL)kb_isPhoneNumber {
    NSString *regex = @"^1[0-9]{10}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isPhoneNumber = [predicate evaluateWithObject:self];
    if (isPhoneNumber) {
        return YES;
    }
    return NO;
}

- (NSString *)kb_urlEncode {
    NSString *outputStr = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    return outputStr;
}

//- (NSString *)kb_urlDecode {
//    NSString *output = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8);
//    return output;
//}

@end
