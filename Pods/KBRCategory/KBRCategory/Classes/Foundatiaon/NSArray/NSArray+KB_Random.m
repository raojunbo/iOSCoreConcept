//
//  NSArray+KB_Random.m
//  RapidCalculation
//
//  Created by lihui on 2017/9/7.
//  Copyright © 2017年 knowin. All rights reserved.
//

#import "NSArray+KB_Random.h"

@implementation NSArray (KB_Random)

/// 随机获取一个值
- (id)kb_getOne
{
    if (0 == self.count)
    {
        return nil;
    }
    if (self.count == 1)
    {
        return [self objectAtIndex:0];
    }
    
    int index = arc4random() % self.count;
    return [self objectAtIndex:index];
}

@end
