//
//  NSObject+RAO2KVC.m
//  CoreConcept
//
//  Created by rjb on 2018/7/5.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "NSObject+RAO2KVC.h"
#import <objc/message.h>
/*
 为什么需要进行设置
 
 */
@implementation NSObject (RAO2KVC)
- (void)RAO_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    
    //动态创建一个类
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [NSString stringWithFormat:@"RAOKVOCLASS_%@",oldClassName];
    const char * newName = [newClassName UTF8String];
    
    Class newClass = objc_allocateClassPair([self class], newName, 0);
    
    //为类动态添加方法
    class_addMethod(newClass, @selector(setName:),(IMP)setName, "v@:i");
    
    //注册新添加的类
    objc_registerClassPair(newClass);
    
    NSLog(@"之前%s",class_getName(self.class));
    object_setClass(self, newClass);
    NSLog(@"之后%s", class_getName(self.class));
   
    //将observer存起来
    objc_setAssociatedObject(self, "objc", observer, OBJC_ASSOCIATION_RETAIN);
}

static void setName(id self, SEL cmd,const char * age) {
    
    //子类
    Class myClass = [self class];
    //将class设置成父类
    object_setClass(self, class_getSuperclass([self class]));
    
    objc_msgSend(self, @selector(setName:),age);
    id observer = objc_getAssociatedObject(self, (__bridge const void *)@"objc");
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),self,age,nil,nil);
    
    

}

@end
