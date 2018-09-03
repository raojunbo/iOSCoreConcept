//
//  RuntimeViewController.m
//  testdown
//
//  Created by rjb on 2018/5/18.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RuntimeViewController.h"
#import <objc/runtime.h>

@interface RuntimeViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation RuntimeViewController{
    NSArray *_dataArrayIvar;
}

-(void)doFunc{
    NSLog(@"打印doFunc");
}

+ (void)dofunc2 {
    NSLog(@"打印dofun2");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    struct objc_class {
//        Class _Nonnull isa  OBJC_ISA_AVAILABILITY;
//
//#if !__OBJC2__
//        Class _Nullable super_class                              OBJC2_UNAVAILABLE;
//        const char * _Nonnull name                               OBJC2_UNAVAILABLE;
//        long version                                             OBJC2_UNAVAILABLE;
//        long info                                                OBJC2_UNAVAILABLE;
//        long instance_size                                       OBJC2_UNAVAILABLE;
//        struct objc_ivar_list * _Nullable ivars                  OBJC2_UNAVAILABLE;
//        struct objc_method_list * _Nullable * _Nullable methodLists                    OBJC2_UNAVAILABLE;
//        struct objc_cache * _Nonnull cache                       OBJC2_UNAVAILABLE;
//        struct objc_protocol_list * _Nullable protocols          OBJC2_UNAVAILABLE;
//#endif
//
//    } OBJC2_UNAVAILABLE;
    
    //与类相关的API
    //Class
    //获得类名
    self.view.backgroundColor = [UIColor whiteColor];
    
    const char * resutl0 = class_getName([self class]);//获取类名
    NSString *resutlStr = [NSString stringWithUTF8String:resutl0];
    NSLog(@"这是resultStr:%@",resutlStr);
    
    //获取父类
    Class superClass = class_getSuperclass([self class]);
    NSLog(@"这是父类:%@",superClass);
    
    //获取变量大小
    size_t classSize = class_getInstanceSize([self class]);
    NSLog(@"这是classSize:%zu",classSize);
    
    //是否是元类
    if(class_isMetaClass([self class])){
        NSLog(@"self class 是元类");
    }
    
    if( class_isMetaClass(superClass)){
        NSLog(@"superClass是元类");
    };
    
    const char * className = object_getClassName([self class]);
    Class metaClass = objc_getMetaClass(className);
    if(class_isMetaClass(metaClass)){
        NSLog(@"是元类");
    }
   
    //获取实例变量
    const char * dataArrayIvarCstring = [@"_dataArray" UTF8String];
    Ivar dataArrayIvar = class_getInstanceVariable([self class], dataArrayIvarCstring);
    NSLog(@"这是Ivar:%@", [NSString stringWithUTF8String:ivar_getName(dataArrayIvar)]);
    
    //获取属性(属性会自动生成实例变量)
    const char * dataArrayPropertyCstring = [@"dataArray" UTF8String];
    objc_property_t dataArrayPropertyr = class_getProperty([self class], dataArrayPropertyCstring);
    NSLog(@"这是property:%@", [NSString stringWithUTF8String:property_getName(dataArrayPropertyr)]);
    
    //通过SEL找到Method,并找到相应的实现
    IMP doFuncMethodImp = class_getMethodImplementation([self class], @selector(doFunc));
    doFuncMethodImp(self,@selector(doFunc));

    //获取类方法
    Method dofun2Method = class_getClassMethod([self class], @selector(dofunc2));
    IMP dofun2MethodImp = method_getImplementation(dofun2Method);
    dofun2MethodImp(self,@selector(dofun2Method));
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
