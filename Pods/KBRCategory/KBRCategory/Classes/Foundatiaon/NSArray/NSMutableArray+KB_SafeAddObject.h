//
//  NSMutableArray+KB_SafeAddObject.h
//  RapidCalculation
//
//  Created by lihui on 2017/9/7.
//  Copyright © 2017年 knowin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (KB_SafeAddObject)

/// 安全添加项
- (void)kb_addObject:(id)anObject;
- (void)kb_removeFirstObject;
- (void)kb_insertObject:(id)aObject atIndex:(NSUInteger)aIndex;
- (void)kb_removeObjectAtIndex:(NSUInteger)aIndex;
- (void)kb_replaceObjectAtIndex:(NSUInteger)aIndex withObject:(id)anObject;
- (void)kb_objectAtIndex:(NSInteger)index;
@end
