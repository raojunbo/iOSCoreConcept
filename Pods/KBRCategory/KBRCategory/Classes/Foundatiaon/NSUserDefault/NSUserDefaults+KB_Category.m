//
//  NSUserDefaults+KB_Category.m
//  RapidCalculation
//
//  Created by lihui on 2018/1/4.
//  Copyright © 2018年 knowin. All rights reserved.
//

#import "NSUserDefaults+KB_Category.h"

#define kNSUserDefaults [NSUserDefaults standardUserDefaults]
#define kNSUserDefaultsSyn [kNSUserDefaults synchronize]

@implementation NSUserDefaults (KB_Category)

+ (nullable id)kb_objectForKey:(NSString *)defaultName
{
    return [kNSUserDefaults objectForKey:defaultName];
}

+ (void)kb_setObject:(nullable id)value forKey:(NSString *)defaultName
{
    [kNSUserDefaults setObject:value forKey:defaultName];
    kNSUserDefaultsSyn;
}

+ (void)kb_removeObjectForKey:(NSString *)defaultName
{
    [kNSUserDefaults removeObjectForKey:defaultName];
}

+ (nullable NSString *)kb_stringForKey:(NSString *)defaultName
{
    return [kNSUserDefaults stringForKey:defaultName];
}

+ (nullable NSArray *)kb_arrayForKey:(NSString *)defaultName
{
    return [kNSUserDefaults arrayForKey:defaultName];
}

+ (nullable NSDictionary<NSString *, id> *)kb_dictionaryForKey:(NSString *)defaultName
{
    return [kNSUserDefaults dictionaryForKey:defaultName];
}

+ (nullable NSData *)kb_dataForKey:(NSString *)defaultName
{
    return [kNSUserDefaults dataForKey:defaultName];
}

+ (nullable NSArray<NSString *> *)kb_stringArrayForKey:(NSString *)defaultName
{
    return [kNSUserDefaults stringArrayForKey:defaultName];
}

+ (NSInteger)kb_integerForKey:(NSString *)defaultName
{
    return [kNSUserDefaults integerForKey:defaultName];
}

+ (float)kb_floatForKey:(NSString *)defaultName
{
    return [kNSUserDefaults floatForKey:defaultName];
}

+ (double)kb_doubleForKey:(NSString *)defaultName
{
    return [kNSUserDefaults doubleForKey:defaultName];
}

+ (BOOL)kb_boolForKey:(NSString *)defaultName
{
    return [kNSUserDefaults boolForKey:defaultName];
}

+ (nullable NSURL *)kb_URLForKey:(NSString *)defaultName
{
    return [kNSUserDefaults URLForKey:defaultName];
}

+ (void)kb_setInteger:(NSInteger)value forKey:(NSString *)defaultName
{
    [kNSUserDefaults setInteger:value forKey:defaultName];
    kNSUserDefaultsSyn;
}

+ (void)kb_setFloat:(float)value forKey:(NSString *)defaultName
{
    [kNSUserDefaults setFloat:value forKey:defaultName];
    kNSUserDefaultsSyn;
}

+ (void)kb_setDouble:(double)value forKey:(NSString *)defaultName
{
    [kNSUserDefaults setDouble:value forKey:defaultName];
    kNSUserDefaultsSyn;
}

+ (void)kb_setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [kNSUserDefaults setBool:value forKey:defaultName];
    kNSUserDefaultsSyn;
}

+ (void)kb_setURL:(nullable NSURL *)url forKey:(NSString *)defaultName
{
    [kNSUserDefaults setURL:url forKey:defaultName];
    kNSUserDefaultsSyn;
}

@end
