//
//  NSMutableArray+KB_SafeAddObject.m
//  RapidCalculation
//
//  Created by lihui on 2017/9/7.
//  Copyright © 2017年 knowin. All rights reserved.
//

#import "NSMutableArray+KB_SafeAddObject.h"

@implementation NSMutableArray (KB_SafeAddObject)

/// 安全添加项
- (void)kb_addObject:(id)aObject
{
    if (nil != aObject)
    {
        [self addObject:aObject];
    }
}

- (void)kb_removeFirstObject
{
    if (self.count > 0)
    {
        [self removeObjectAtIndex:0];
    }
}

- (void)kb_insertObject:(id)aObject atIndex:(NSUInteger)aIndex
{
    if (nil == aObject)
    {
        return;
    }
    
    if (aIndex < self.count)
    {
        [self insertObject:aObject atIndex:aIndex];
    }
}

- (void)kb_removeObjectAtIndex:(NSUInteger)aIndex
{
    if (aIndex < self.count)
    {
        [self removeObjectAtIndex:aIndex];
    }
}

- (void)kb_replaceObjectAtIndex:(NSUInteger)aIndex withObject:(id)anObject
{
    if (aIndex < self.count && nil != anObject)
    {
        [self replaceObjectAtIndex:aIndex withObject:anObject];
    }
}



@end
