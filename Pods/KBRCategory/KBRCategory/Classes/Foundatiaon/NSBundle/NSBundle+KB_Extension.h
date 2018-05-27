//
//  NSBundle+KB_Extension.h
//  BookerReading-Apple
//
//  Created by lihui on 2018/3/16.
//  Copyright © 2018年 KnownBox. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KB_MainBundle  [NSBundle mainBundle]

#define KB_APPVERSION         [NSBundle kb_appVersion]
#define KB_APPBUILDVERSION    [NSBundle kb_appBuildVersion]

@interface NSBundle (KB_Extension)

+ (NSString *)kb_appVersion;
+ (NSString *)kb_appBuildVersion;

@end
