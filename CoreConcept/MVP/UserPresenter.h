//
//  UserPresenter.h
//  CoreConcept
//
//  Created by rjb on 2018/6/24.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserViewData:NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy) NSString *age;

- (instancetype)initWithName:(NSString *)name withAge:(NSString *)age;

@end

@protocol UserViewDelegate<NSObject>

- (void)startloading;

- (void)finishloading;

- (void)setUsers:(NSArray<UserViewData *>*)usersData;

- (void)setEmptyUsers;

@end

@interface UserPresenter : NSObject

@property (nonatomic,weak)id<UserViewDelegate> delegate;

-(void)getUsers;

@end
