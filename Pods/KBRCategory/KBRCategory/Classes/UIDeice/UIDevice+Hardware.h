//
//  UIDevice+Hardware.h
//  PFastCalculation
//
//  Created by Aslan on 7/8/16.
//  Copyright © 2016 Knowin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Hardware)

+ (NSString *)kb_systemVersion;
+ (BOOL)kb_isPad;
+ (BOOL)kb_canMakePhoneCalls;

+ (NSString *)kb_ipAddressWIFI;
+ (NSString *)kb_ipAddressCell;

+ (NSString *)kb_modelName;

+ (NSString *)kb_deviceModel;
+ (NSString *)kb_deviceType;

+ (NSString *)kb_getProxy;

@end
