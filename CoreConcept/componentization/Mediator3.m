//
//  Mediator3.m
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Mediator3.h"

@interface Mediator3()
@property (nonatomic, strong)NSMutableDictionary *cache;
@end

@implementation Mediator3

- (instancetype)init {
    if(self = [super init]){
        _cache = [[NSMutableDictionary alloc]init];
    }
    return self;
}

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static Mediator3 *mediator = nil;
    dispatch_once(&onceToken, ^{
        
        mediator = [[self alloc]init];
    });
    return mediator;
}

- (void)registerURLPattern:(NSString *)urlPattern toHandler:(componetBlock)block {
    [self.cache setObject:block forKey:urlPattern];
}

- (void)openURL:(NSString *)url withParam:(id)param {
    componetBlock block = [self.cache objectForKey:url];
    if(block){
        block(param);
    }
}

- (void)registerURLPattern:(NSString *)urlPattern toObjectHandler:(objectComponetBlock)block {
    [self.cache setObject:block forKey:urlPattern];
}

- (id)objectForURL:(NSString *)url withParam:(id)param{
    objectComponetBlock block = [self.cache objectForKey:url];
    if(block){
        return block(param);
    }
    return nil;
}

@end
