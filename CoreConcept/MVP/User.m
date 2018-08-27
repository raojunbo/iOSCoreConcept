//
//  User.m
//  CoreConcept
//
//  Created by rjb on 2018/6/24.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                              age:(NSInteger )age {
    self = [super init];
    if(self){
        _firstName = firstName;
        _lastName = lastName;
        _email = email;
        _age = age;
    }
    return self;
}


+(void)getUsers:(void (^)(NSArray<User *> *))usersBlock {
    NSInteger count = 11;
    NSMutableArray<User *> *users = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i<count; i++) {
        NSString *indexStr = [NSString stringWithFormat:@"%@",@(i)];
        User *model = [[User alloc]initWithFirstName:indexStr lastName:indexStr email:indexStr age:10];
        [users addObject:model];
    }
    
    double delay = 2;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(usersBlock){
            usersBlock(users);
        }
    });
}

@end
