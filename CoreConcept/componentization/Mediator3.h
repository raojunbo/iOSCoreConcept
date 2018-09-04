//
//  Mediator3.h
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^componetBlock)(id param);
typedef id(^objectComponetBlock)(id param);

/*
 原理就是将url与Block进行映射
 url起到两个作用：一是作为key值与block进行映射，二是可以直接接参数就想普通url后面跟参数一样。
 
 特别说明:
 url传递参数受到一定的限制。比如对本地来说，需要传非常规的参数时，就办不到。
 这里我自己的Demo直接将参数放在了函数后面省去对url进行解析的操作。实际的开发中将这个参数从url里解析出来。
 */

@interface Mediator3 : NSObject

+ (instancetype)shareInstance;

//指定相应的url的执行操作
//例如，只是简单的打开一个页面
- (void)registerURLPattern:(NSString *)urlPattern toHandler:(componetBlock)block;
//打开某个页面
- (void)openURL:(NSString *)url withParam:(id)param;


//指定相应rul的执行操作，并给一个返回值
//例如打开一个页面，或者在一个组件里面取值后返回来
- (void)registerURLPattern:(NSString *)urlPattern toObjectHandler:(objectComponetBlock)block;
//取得某个组件操作后的值
- (id)objectForURL:(NSString *)url withParam:(id)param;


@end
