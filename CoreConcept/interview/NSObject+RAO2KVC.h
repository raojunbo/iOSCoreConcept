//
//  NSObject+RAO2KVC.h
//  CoreConcept
//
//  Created by rjb on 2018/7/5.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RAO2KVC)

- (void)RAO_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;

@end
