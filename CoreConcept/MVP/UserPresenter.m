//
//  UserPresenter.m
//  CoreConcept
//
//  Created by rjb on 2018/6/24.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "UserPresenter.h"

@implementation UserViewData

- (instancetype)initWithName:(NSString *)name withAge:(NSString *)age {
    if(self = [super init]){
        _name = name;
        _age = age;
    }
    return self;
}

@end

@implementation UserPresenter

- (void)getUsers {
    __weak typeof(self) weakSelf = self;
    [User getUsers:^(NSArray<User *> * users) {
        [weakSelf.delegate finishloading];
        BOOL hasUser = users && users.count;
        if(!hasUser){
            [self.delegate setEmptyUsers];
        }else{
            NSMutableArray<UserViewData *> *userViewDatas = [NSMutableArray arrayWithCapacity:users.count];
            for (User *user in users) {
                NSString *ageStr = [NSString stringWithFormat:@"%@",@(user.age)];
                UserViewData *userViewData = [[UserViewData alloc]initWithName:user.firstName withAge:ageStr];
                [userViewDatas addObject:userViewData];
                
            }
            [self.delegate setUsers:userViewDatas];

        }
    }];
}

@end
