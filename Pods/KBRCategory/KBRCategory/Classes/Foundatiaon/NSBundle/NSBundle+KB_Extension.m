//
//  NSBundle+KB_Extension.m
//  BookerReading-Apple
//
//  Created by lihui on 2018/3/16.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import "NSBundle+KB_Extension.h"

@implementation NSBundle (KB_Extension)

+ (NSString *)kb_appVersion
{
    return [[KB_MainBundle infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)kb_appBuildVersion
{
    return [[KB_MainBundle infoDictionary] objectForKey:@"CFBundleVersion"];
}

@end
