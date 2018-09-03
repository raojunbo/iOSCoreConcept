//
//  Mediator3.h
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^componetBlock)(id param);


//原理就是将url与Block进行映射
//所以这里的url只是起到一个key值的作用。
//pram的参数受到一定的限制。比如对本地来说，需要传非常规的参数时，就办不到。

@interface Mediator3 : NSObject

+ (instancetype)shareInstance;

- (void)registerURLPattern:(NSString *)urlPattern toHandler:(componetBlock)block;

- (void)openURL:(NSString *)url withParam:(id)param;

@end
