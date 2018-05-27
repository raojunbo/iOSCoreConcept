//
//  BlockPerson.h
//  testdown
//
//  Created by rjb on 2018/5/26.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockPerson : NSObject

@property (nonatomic, strong)void(^raoblock)(void);


/*
 在做为参数时，是不需要名字的
 */
- (void)eat:(void(^)(NSString *))eatBlock;

- (void(^)(int m))run;

@end
