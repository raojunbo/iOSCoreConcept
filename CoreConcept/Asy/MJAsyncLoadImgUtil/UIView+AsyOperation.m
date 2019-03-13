//
//  UIView+AsyOperation.m
//  CoreConcept
//
//  Created by rjb on 2019/3/12.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "UIView+AsyOperation.h"

#import "objc/runtime.h"

static char kAsyloadOperationKey;

typedef NSMapTable<NSString *, AsyDrawOperation *> AsyOperationsDictionary;

@implementation UIView (AsyOperation)

- (AsyOperationsDictionary *)mj_operationDictionary {
    @synchronized(self) {
        AsyOperationsDictionary *operations = objc_getAssociatedObject(self, &kAsyloadOperationKey);
        if (operations) {
            return operations;
        }
        operations = [[NSMapTable alloc] initWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsWeakMemory capacity:0];
        objc_setAssociatedObject(self, &kAsyloadOperationKey, operations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return operations;
    }
}

- (void)mj_setImageLoadOperation:(AsyDrawOperation *)operation forKey:(nullable NSString *)key {
    if (!operation) {
        return;
    }
    if (key) {
        [self mj_cancelImageLoadOperationWithKey:key];
        if (operation) {
            AsyOperationsDictionary *operationDictionary = [self mj_operationDictionary];
            @synchronized (self) {
                [operationDictionary setObject:operation forKey:key];
            }
        }
    }
}

- (void)mj_cancelImageLoadOperationWithKey:(nullable NSString *)key {
    AsyOperationsDictionary *operationDictionary = [self mj_operationDictionary];
    AsyDrawOperation *operation;
    @synchronized (self) {
        operation = [operationDictionary objectForKey:key];
    }
    if (operation) {
        [operation cancel];
        @synchronized (self) {
            [operationDictionary removeObjectForKey:key];
        }
    }
}

- (void)mj_removeImageLoadOperationWithKey:(nullable NSString *)key {
    if (key) {
        AsyOperationsDictionary *operationDictionary = [self mj_operationDictionary];
        @synchronized (self) {
            [operationDictionary removeObjectForKey:key];
        }
    }
}

@end
