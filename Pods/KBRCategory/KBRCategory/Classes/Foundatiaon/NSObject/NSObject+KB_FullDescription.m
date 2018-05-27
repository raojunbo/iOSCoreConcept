//
//  NSObject+KB_FullDescription.m
//  RapidCalculation-Apple
//
//  Created by john on 2017/10/10.
//  Copyright © 2017年 knowin. All rights reserved.
//

#import "NSObject+KB_FullDescription.h"
#import <objc/runtime.h>

@implementation NSObject (KB_FullDescription)

- (NSString *)kb_fullDescription
{
    NSMutableDictionary *fullDescriptionDictionary = [NSMutableDictionary dictionary];
    NSString *debugDescription = [NSString stringWithFormat:@"<%@>: %p", NSStringFromClass(self.class), self];
    fullDescriptionDictionary[@"__Object"] = debugDescription;
    unsigned int propertiesCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &propertiesCount);
    for (unsigned int i = 0; i < propertiesCount; i++)
    {
        objc_property_t property = properties[i];
        NSString *key = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        if ([key isEqualToString:@"description"] || [key isEqualToString:@"debugDescription"] || [key isEqualToString:@"fullDescription"])
        {
            continue;
        }
        id value = [self valueForKey:key];
        fullDescriptionDictionary[key] = value ?: @"nil";
    }
    free(properties);
    
    return fullDescriptionDictionary.description;
}

@end
