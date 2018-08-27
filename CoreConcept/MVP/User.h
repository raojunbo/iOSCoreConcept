//
//  User.h
//  CoreConcept
//
//  Created by rjb on 2018/6/24.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, copy)NSString *firstName;
@property (nonatomic, copy)NSString *lastName;
@property (nonatomic, copy)NSString *email;
@property (nonatomic,assign)NSInteger age;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                              age:(NSInteger )age;

+ (void)getUsers:(void(^)(NSArray<User *> *))usersBlock;

@end
