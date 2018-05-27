//
//  NSUserDefaults+KB_Category.h
//  RapidCalculation
//
//  Created by lihui on 2018/1/4.
//  Copyright © 2018年 knowin. All rights reserved.
//

#import <Foundation/Foundation.h>

/// getvalue
#define KBUserDefault_objectForKey(aDefaultName)      [NSUserDefaults kb_objectForKey:aDefaultName]
#define KBUserDefault_stringForKey(aDefaultName)      [NSUserDefaults kb_stringForKey:aDefaultName]
#define KBUserDefault_arrayForKey(aDefaultName)       [NSUserDefaults kb_arrayForKey:aDefaultName]
#define KBUserDefault_dictionaryForKey(aDefaultName)  [NSUserDefaults kb_dictionaryForKey:aDefaultName]
#define KBUserDefault_dataForKey(aDefaultName)        [NSUserDefaults kb_dataForKey:aDefaultName]
#define KBUserDefault_stringArrayForKey(aDefaultName) [NSUserDefaults kb_stringArrayForKey:aDefaultName]
#define KBUserDefault_integerForKey(aDefaultName)     [NSUserDefaults kb_integerForKey:aDefaultName]
#define KBUserDefault_floatForKey(aDefaultName)       [NSUserDefaults kb_floatForKey:aDefaultName]
#define KBUserDefault_doubleForKey(aDefaultName)      [NSUserDefaults kb_doubleForKey:aDefaultName]
#define KBUserDefault_boolForKey(aDefaultName)        [NSUserDefaults kb_boolForKey:aDefaultName]
#define KBUserDefault_URLForKey(aDefaultName)         [NSUserDefaults kb_URLForKey:aDefaultName]

/// setvalue
#define KBUserDefault_setObject(aValue, aDefaultName)  [NSUserDefaults kb_setObject:aValue forKey:aDefaultName]
#define KBUserDefault_removeObjectForKey(aDefaultName) [NSUserDefaults kb_removeObjectForKey:aDefaultName]
#define KBUserDefault_setInteger(aValue, aDefaultName) [NSUserDefaults kb_setInteger:aValue forKey:aDefaultName]
#define KBUserDefault_setFloat(aValue, aDefaultName)   [NSUserDefaults kb_setFloat:aValue forKey:aDefaultName]
#define KBUserDefault_setDouble(aValue, aDefaultName)  [NSUserDefaults kb_setDouble:aValue forKey:aDefaultName]
#define KBUserDefault_setBool(aValue, aDefaultName)    [NSUserDefaults kb_setBool:aValue forKey:aDefaultName]
#define KBUserDefault_setURL(aValue, aDefaultName)     [NSUserDefaults kb_setURL:aValue forKey:aDefaultName]

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (KB_Category)
/// setvalue
+ (nullable id)kb_objectForKey:(NSString *)defaultName;
+ (nullable NSString *)kb_stringForKey:(NSString *)defaultName;
+ (nullable NSArray *)kb_arrayForKey:(NSString *)defaultName;
+ (nullable NSDictionary<NSString *, id> *)kb_dictionaryForKey:(NSString *)defaultName;
+ (nullable NSData *)kb_dataForKey:(NSString *)defaultName;
+ (nullable NSArray<NSString *> *)kb_stringArrayForKey:(NSString *)defaultName;
+ (NSInteger)kb_integerForKey:(NSString *)defaultName;
+ (float)kb_floatForKey:(NSString *)defaultName;
+ (double)kb_doubleForKey:(NSString *)defaultName;
+ (BOOL)kb_boolForKey:(NSString *)defaultName;
+ (nullable NSURL *)kb_URLForKey:(NSString *)defaultName;

/// getvalue
+ (void)kb_setObject:(nullable id)value forKey:(NSString *)defaultName;
+ (void)kb_removeObjectForKey:(NSString *)defaultName;
+ (void)kb_setInteger:(NSInteger)value forKey:(NSString *)defaultName;
+ (void)kb_setFloat:(float)value forKey:(NSString *)defaultName;
+ (void)kb_setDouble:(double)value forKey:(NSString *)defaultName;
+ (void)kb_setBool:(BOOL)value forKey:(NSString *)defaultName;
+ (void)kb_setURL:(nullable NSURL *)url forKey:(NSString *)defaultName;

@end

NS_ASSUME_NONNULL_END

