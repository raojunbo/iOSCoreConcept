//
//  NeedSerializeObject.m
//  MojiWeather
//
//  Created by rjb on 2020/5/29.
//  Copyright © 2020 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import "NeedYYCodingCopyObject.h"
#import "YYModel.h"

@implementation NeedYYCodingCopyObject

- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self yy_modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }
- (NSUInteger)hash { return [self yy_modelHash]; }
- (BOOL)isEqual:(id)object { return [self yy_modelIsEqual:object]; }
- (NSString *)description { return [self yy_modelDescription]; }

@end
