//
//  ProtocolMediator3.h
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProtocolMediator3 : NSObject

+ (instancetype)shareInstance;

- (void)registerProtocol:(Protocol *)proto forClass:(Class)cls;

- (Class)classForProtocol:(Protocol *)proto;

@end
