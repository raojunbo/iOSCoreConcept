//
//  MTeacher.m
//  testdown
//
//  Created by rjb on 2018/1/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "MTeacher.h"

@implementation MTeacher

+ (void)work{
    NSLog(@"I am Teacher");
}
+(void)Runtimeowork{
    NSLog(@"I am student");
}

+(void)load{
    NSString *className = NSStringFromClass(self.class);
    NSLog(@"className%@",className);
    SEL originSelector = @selector(work);//得到方法签名
    SEL swizzleSelector = @selector(Runtimeowork);//得到方法签名
    //类的方法
    Method oriMethod = class_getClassMethod(self.class, originSelector);
    Method swizzMethod = class_getClassMethod(self.class, swizzleSelector);
    method_exchangeImplementations(oriMethod, swizzMethod);
}
@end
