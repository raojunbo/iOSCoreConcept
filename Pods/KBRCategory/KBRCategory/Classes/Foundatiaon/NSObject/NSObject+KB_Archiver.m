//
//  NSObject+KB_Archiver.m
//  RapidCalculation
//
//  Created by lihui on 2018/1/23.
//  Copyright © 2018年 knowin. All rights reserved.
//

#import "NSObject+KB_Archiver.h"
#import <objc/runtime.h>

@implementation NSObject (KB_Archiver)

- (void)kb_coderWithCoder:( NSCoder * _Nullable )aCoder Class:(nullable Class)aClass
{
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(aClass, &count);
    
    for (int i = 0; i < count; i++)
    {
        Ivar ivar = ivars[i];
        
        const char * name = ivar_getName(ivar);
        
        NSString *key = [[NSString alloc] initWithUTF8String:name];
        
        id value = [self valueForKey:key];
        
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (void)kb_decoderWithCoder:( NSCoder * _Nullable )aDecoder Class:(nullable Class)aClass
{
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(aClass, &count);
    
    for (int i = 0; i < count; i++)
    {
        Ivar ivar = ivars[i];
        
        const char * name = ivar_getName(ivar);
        
        NSString *key = [[NSString alloc] initWithUTF8String:name];
        
        id value = [aDecoder decodeObjectForKey:key];
        
        [self setValue:value forKey:key];
    }
    free(ivars);
}

@end
