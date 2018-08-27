//
//  SwizzView+swizz.m
//  CoreConcept
//
//  Created by rjb on 2018/7/8.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "SwizzView+swizz.h"
#import <objc/message.h>

@implementation SwizzView (swizz)

+(void)load {
    Method handMethod = class_getInstanceMethod(self.class, @selector(handle));//获取实例方法
    Method kbhandMethod = class_getInstanceMethod(self.class, @selector(kb_handle));//获得实例的Method
    method_exchangeImplementations(handMethod, kbhandMethod);//两者方法进行交换
}

//重写方法，是不会用super调用那个方法的。所以只能用方法的交互
/*
 哈哈，这块就是一个很有用点。可以拿出来打谈特谈。
 */
/*
 我们常说不要用分类去重写原始类的方法。一方面是因为重写无法获得原始类的方法（要想获得其实也是有办法的，通过遍历方法列表，其实类方法是添加到了方法列表前面的）
 这里也就是通过方法的交互，来实现类似于继承实现。通过分类，也就是通过方法交互，实现继承
 */
- (void)kb_handle {
    [self kb_handle];
    NSLog(@"我是后添加的处理");
}

@end
