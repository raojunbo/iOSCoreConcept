//
//  NSObject+KB_Chain.h
//  KZPlayground
//
//  Created by Huan WANG on 10/10/16.
//  Copyright © 2016 KnowBox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KB_Chain)

- (instancetype)kb_chainWithBlock:(void (^)(id obj))chainBlock;

@end

@interface NSObject (KB_Block)
    
- (id)kb_performBlock:(void (^)(id obj))block afterDelay:(NSTimeInterval)delay;
+ (id)kb_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
- (id)kb_performBlockInBackground:(void (^)(id obj))block afterDelay:(NSTimeInterval)delay;
+ (id)kb_performBlockInBackground:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
- (id)kb_performBlock:(void (^)(id obj))block onQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay;
+ (id)kb_performBlock:(void (^)(void))block onQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay;
+ (void)kb_cancelBlock:(id)block;
    
@end
