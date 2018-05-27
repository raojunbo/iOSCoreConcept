//
//  NSArray+Safe.m
//  KBFoundation
//
//  Created by rjb on 2018/3/31.
//  Copyright © 2018年 BookerReading. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)

- (id)kb_objectAtIndex:(NSInteger)index {
    if (index < self.count) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}

@end
