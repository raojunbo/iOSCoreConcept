//
//  Mediator2.m
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Mediator2.h"

//采用反射机制实现mediator2不依赖模块。只让模块依赖mediator

@implementation Mediator2

+ (UIViewController *)bookDetailComponent_viewController:(NSString *)bookId {
    Class cls = NSClassFromString(@"BookDetailViewController");
    //反射机制是类（类对象）已经存在。才能通过NSClassFromString从类对象的表里取得这个类对象。
    return  [[cls alloc]init];
}

+ (UIViewController *)reviewComponet_viewController:(NSString *)bookId reviewType:(NSInteger)type {
    Class cls = NSClassFromString(@"BookReviewViewController");
    return [[cls alloc]init];
}

//为了解决这些重复的代码，

@end
