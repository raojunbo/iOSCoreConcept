//
//  NSObject+RAOKVO.h
//  CoreConcept
//
//  Created by rjb on 2018/6/4.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RAOKVO)
- (void)rao_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
@end
