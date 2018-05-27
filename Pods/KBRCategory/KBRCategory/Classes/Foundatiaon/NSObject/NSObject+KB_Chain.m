//
//  NSObject+KB_Chain.m
//  KZPlayground
//
//  Created by Huan WANG on 10/10/16.
//  Copyright © 2016 KnowBox. All rights reserved.
//

#import "NSObject+KB_Chain.h"
#define KBTimeDelay(t) dispatch_time(DISPATCH_TIME_NOW, (uint64_t)(NSEC_PER_SEC * t))

@implementation NSObject (KB_Chain)

- (instancetype)kb_chainWithBlock:(void (^)(id))chainBlock
{
	if (chainBlock)
    {
		chainBlock(self);
	}
	return self;
}

@end

@implementation NSObject (KB_Block)

- (id)kb_performBlock:(void (^)(id))block afterDelay:(NSTimeInterval)delay
    {
    return [self kb_performBlock:block onQueue:dispatch_get_main_queue() afterDelay:delay];
}

+ (id)kb_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    return [NSObject kb_performBlock:block onQueue:dispatch_get_main_queue() afterDelay:delay];
}

- (id)kb_performBlockInBackground:(void (^)(id))block afterDelay:(NSTimeInterval)delay
{
    return [self kb_performBlock:block onQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0) afterDelay:delay];
}

+ (id)kb_performBlockInBackground:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    return [NSObject kb_performBlock:block onQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0) afterDelay:delay];
}

- (id)kb_performBlock:(void (^)(id obj))block onQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay {
    NSParameterAssert(block != nil);
    __block BOOL cancelled = NO;
    void (^wrapper)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = true;
            return;
        }
        if (!cancelled) block(self);
    };
    dispatch_after(KBTimeDelay(delay), queue, ^{
        wrapper(NO);
    });
    return [wrapper copy];
}

+ (id)kb_performBlock:(void (^)(void))block onQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay {
    NSParameterAssert(block != nil);
    __block BOOL cancelled = NO;
    void (^wrapper)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = true;
            return;
        }
        if (!cancelled) block();
    };
    dispatch_after(KBTimeDelay(delay), queue, ^{
        wrapper(NO);
    });
    return [wrapper copy];
}

+ (void)kb_cancelBlock:(id)block {
    NSParameterAssert(block != nil);
    void(^wrapper)(BOOL) = block;
    wrapper(true);
}

@end
