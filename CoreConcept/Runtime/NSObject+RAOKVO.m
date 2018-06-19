//
//  NSObject+RAOKVO.m
//  CoreConcept
//
//  Created by rjb on 2018/6/4.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "NSObject+RAOKVO.h"
#import <objc/message.h>
const char *key;
@implementation NSObject (RAOKVO)

- (void)rao_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    /*
     动态创建一个新类
     */
    NSString *oldName = NSStringFromClass([self class]);
    NSString *newName = [@"RAO" stringByAppendingString:oldName];
    
    Class myClass = objc_allocateClassPair([self class], [newName UTF8String], 0);
    objc_registerClassPair(myClass);//注册类(相当于加载吧)
    object_setClass(self, myClass);//更改本类类型（修改isa指向）
    
    //重写setName，实际是给子类添加方法(因为如果本类没方法，实际是找到父类方法)
    class_addMethod(myClass, @selector(setName:), (IMP)setName,"v@:@");
    
    //将观察者绑定到子类对象
    objc_setAssociatedObject(self, @"key", observer, OBJC_ASSOCIATION_ASSIGN);//(用ASSIGN防止循环引用)
}

void setName(id self,SEL sel,NSString * name) {
    struct objc_super person = {self,class_getSuperclass([self class])};
    objc_msgSendSuper(&person,sel,name);
    
    //拿出观察者
    id observer = objc_getAssociatedObject(self,@"key");
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),"name",self,@{@"name":name});
}

@end
