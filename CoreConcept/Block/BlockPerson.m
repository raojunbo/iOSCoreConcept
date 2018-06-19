//
//  BlockPerson.m
//  testdown
//
//  Created by rjb on 2018/5/26.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BlockPerson.h"

@interface BlockPerson()
@property (nonatomic, strong) NSString *foot;
@end

@implementation BlockPerson

- (void)eat:(void (^)(NSString *))eatBlock {
    eatBlock(@"苹果");
}

- (void(^)(int m))run {
    return ^(int m){
        NSLog(@"跑着呢%@",@(m));
    };
}
@end
