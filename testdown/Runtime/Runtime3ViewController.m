//
//  Runtime3ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/18.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Runtime3ViewController.h"
#import <objc/runtime.h>

/*
 添加实例变量
 添加属性
 添加方法
 添加协议
 */
@interface Runtime3ViewController ()

@property (nonatomic, strong) UIColor *property2;

@end

@implementation Runtime3ViewController {
    NSArray *_property0;
    NSArray *property1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    
    //动态创建类,从参数里可以看出,可以指定父列
    Class CreatClass0 = objc_allocateClassPair([NSObject class], "CreatedClass0", 0);
    
    //动态添加实例变量
    class_addIvar(CreatClass0, "_attribute0", sizeof(NSString *), log(sizeof(NSString *)), "i");
    Ivar ivar = class_getInstanceVariable(CreatClass0, "_attribute0");
    objc_registerClassPair(CreatClass0);
    
    //(添加实例变量后再动态添加属性
    objc_property_attribute_t type2 = {"T","@\"NSString\""};//T，属性类型
    objc_property_attribute_t ownership2 = {"C",""};//C，属性的修饰符 copy
    objc_property_attribute_t backingivar2 ={"V","_attribute0"};//V，属性对应的实例变量值
    objc_property_attribute_t attrs2[] = { type2, ownership2, backingivar2 };//属性数组
    class_addProperty(CreatClass0, "_attribute0", attrs2, 3);//为一个类添加上面设置的属性
    
    SEL getter = NSSelectorFromString(@"attribute0");
    SEL setter= NSSelectorFromString(@"setAttribute0:");
    
    //(添加属性后，再为属性添加get,set的方法，将SEL,与实现绑定,并添加到类里
    BOOL suc0 = class_addMethod(CreatClass0, getter, (IMP)attribute0Getter, "@@:");
    BOOL suc1 = class_addMethod(CreatClass0, setter, (IMP)attribute0Setter, "v@:@");
    NSLog(@"这是suc0:%@,suc1:%@",@(suc0),@(suc1));

    //根据动态创建的类，创建对象
    id idClass = [[CreatClass0 alloc]init];
    
    //执行动态创建的类的方法
    [idClass performSelector:setter withObject:@"你好"];
    NSLog(@"这是被设置的:%@",[idClass performSelector:getter withObject:nil]);
    
    
    //获取整理实例犯法
    unsigned int copycopyMethodListCount = 0;
    Method *methods = class_copyMethodList(CreatClass0, &copycopyMethodListCount);
    for (int i = 0; i< copycopyMethodListCount; i++) {
        Method tmpMethod = methods[i];
        SEL tmpName = method_getName(tmpMethod);
        NSLog(@"这是所有函数的名字:%@", NSStringFromSelector(tmpName));
    }
    
    //添加协议
    class_addProtocol(CreatClass0,  NSProtocolFromString(@"UITableViewDelegate"));
    
}

//get方法
NSString *attribute0Getter(id classInstance, SEL _cmd) {
    Ivar ivar = class_getInstanceVariable([classInstance class], "_attribute0");//获取变量,如果没获取到说明不存在
    return object_getIvar(classInstance, ivar);
}

//set方法
void attribute0Setter(id classInstance, SEL _cmd, NSString *newName) {
    Ivar ivar = class_getInstanceVariable([classInstance class], "_attribute0");//获取变量,如果没获取到说明不存在
    id oldName = object_getIvar(classInstance, ivar);
    if (oldName != newName) object_setIvar(classInstance, ivar, [newName copy]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
