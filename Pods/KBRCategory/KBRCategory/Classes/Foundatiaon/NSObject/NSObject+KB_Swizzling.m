//
//  NSObject+KB_Swizzling.m
//  RapidCalculation-Apple
//
//  Created by john on 2017/10/10.
//  Copyright © 2017年 knowin. All rights reserved.
//

#import "NSObject+KB_Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (KB_Swizzling)

+ (BOOL)kb_swizzleObjectMethod:(SEL)originalSelector anotherMethod:(SEL)altSelector
    {
    Method originalM = class_getInstanceMethod(self, originalSelector);
    Method altM = class_getInstanceMethod(self, altSelector);
    
    if (!originalM || !altM) {
        return NO;
    }
    
    BOOL ret = class_addMethod(self, originalSelector, method_getImplementation(altM), method_getTypeEncoding(altM));
    
    if (ret)
    {
        class_replaceMethod([self class], altSelector, method_getImplementation(originalM), method_getTypeEncoding(originalM));
    }
    else
    {
        method_exchangeImplementations(originalM, altM);
    }

    return YES;
}

+ (BOOL)kb_swizzleClassMethod:(SEL)originalSelector anotherMethod:(SEL)altSelector
{
    return [object_getClass(self) kb_swizzleObjectMethod:originalSelector anotherMethod:altSelector];
}

@end
