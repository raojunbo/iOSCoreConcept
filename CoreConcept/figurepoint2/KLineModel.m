//
//  KLineModel.m
//  KLine-Chart-OC
//
//  Created by 何俊松 on 2020/3/10.
//  Copyright © 2020 hjs. All rights reserved.
//

#import "KLineModel.h"
#import "NSObject+YYModel.h"
@implementation KLineModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"ID":@"id"
    };
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
