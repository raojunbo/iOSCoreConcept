//
//  ProtocolMediator3.m
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "ProtocolMediator3.h"

@interface ProtocolMediator3()
@property (nonatomic, strong)NSMutableDictionary *protocolCache;
@end

@implementation ProtocolMediator3

+ (instancetype)shareInstance  {
    static dispatch_once_t onceToken;
    static ProtocolMediator3 *mediaor = nil;
    dispatch_once(&onceToken, ^{
        mediaor = [[ProtocolMediator3 alloc]init];
    });
    return mediaor;
}

- (instancetype)init {
    if(self  = [super init]){
        self.protocolCache = [[NSMutableDictionary alloc]init];
    }
    return self;
}

//这这里为什么要采用proto的方法
- (void)registerProtocol:(Protocol *)proto forClass:(Class)cls {
    [self.protocolCache setObject:cls forKey:NSStringFromProtocol(proto)];
}

- (Class)classForProtocol:(Protocol *)proto {
    return self.protocolCache[NSStringFromProtocol(proto)];
}

@end
