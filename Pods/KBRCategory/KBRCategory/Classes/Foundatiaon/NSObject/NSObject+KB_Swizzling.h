//
//  NSObject+KB_Swizzling.h
//  RapidCalculation-Apple
//
//  Created by john on 2017/10/10.
//  Copyright © 2017年 knowin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KB_Swizzling)

+ (BOOL)kb_swizzleObjectMethod:(SEL)originalSelector anotherMethod:(SEL)altSelector;

+ (BOOL)kb_swizzleClassMethod:(SEL)originalSelector anotherMethod:(SEL)altSelector;

@end
