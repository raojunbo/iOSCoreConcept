//
//  TestArchiveObject.m
//  MojiWeather
//
//  Created by rjb on 2020/7/17.
//  Copyright © 2020 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import "TestArchiveObject.h"
//#import "NSObject+YYModel.h"

@implementation TestArchiveObject


//+ (NSValueTransformer *)usersJSONTransformer {
//    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[UserArchive class]];
//}


//手动不封
//- (id)initWithCoder:(NSCoder *)decoder{
//    if (self = [super init]){
//        _name = [decoder decodeObjectForKey:@"name"];
//        _age = [decoder decodeObjectForKey:@"age"];
//        _users = [decoder decodeObjectForKey:@"users"];
//    }
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)encoder{
//    [encoder encodeObject:_name forKey:@"name"];
//    [encoder encodeObject:_age forKey:@"age"];
//    [encoder encodeObject:_users forKey:@"users"];
//}

//yymode部分

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"users":UserArchive.class
    };
}
@end
