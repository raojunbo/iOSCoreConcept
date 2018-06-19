//
//  RuntimeModelViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/4.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RuntimeModelViewController.h"
#import <objc/runtime.h>

@interface Cat : NSObject

@end

@implementation Cat

@end

@interface MyCat:NSObject

@end

@implementation MyCat

@end


/*
 对象模型
 */
@interface RuntimeModelViewController ()

@end

@implementation RuntimeModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //费曼法则
    /*
     类对象，里面定义了Class的实例信息,类对象在内存里只有一份。它直接定义了实例变量与方法。里面的元类则定义了类方法
     所以对class_的api，就是对类对象的操作。类对象的变量存储区是不可变的。函数列表是通过链表实现，所以是可以添加的。
     所以方法的交换是在类对象层面实现。类对象只是实现手段，而至于一个类不能调用实例方法，只能调用类方法。就是语言层面的设计了。
     
     一句话总结：NSObject类指向类对象（类对象定义实例方法，isa指向元类（元类定义类方法））,无论类对象，元类都有继承的关系。类对象的super最终执行nil,元类对象
     最终指向自己.
     所有整个的操作都是对类对象的操作。包括方法的互换。
     */
    
    MyCat *myCat = [[MyCat alloc]init];
    Class class = object_getClass(myCat);
    class_getName(class);

    Class metaClass = object_getClass(class);
    class_getName(metaClass);
    class_isMetaClass(metaClass);//原类对象，它定义了类方法
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
