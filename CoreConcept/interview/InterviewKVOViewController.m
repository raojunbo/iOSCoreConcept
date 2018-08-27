//
//  InterviewKVOViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/5.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "InterviewKVOViewController.h"
#import <objc/runtime.h>
@interface KVOCat:NSObject
@property (nonatomic, strong)NSString *name;
@end

@implementation KVOCat

-(void)setName:(NSString *)name {
    [self willChangeValueForKey:name];
    
    [self didChangeValueForKey:name];
    
    //底层相当于调用了observeValueForKeyPath，就是调用监听对象的这个方法
    
    
    
}

- (void)printInfo {
    NSLog(@"isa:%@, supper class:%@", NSStringFromClass(object_getClass(self)),
          class_getSuperclass(object_getClass(self)));
    NSLog(@"self:%@,[self superclass]:%@",self,[self superclass]);
    NSLog(@"age setter function pointer:%p \n",class_getMethodImplementation(object_getClass(self), @selector(setName:)));
    /*
     isa:KVOCat, supper class:NSObject
     self:<KVOCat: 0x600000201bd0>,[self superclass]:NSObject
     age setter function pointer:0x10d68dfe0
     
     isa:NSKVONotifying_KVOCat, supper class:KVOCat
     self:<KVOCat: 0x600000201bd0>,[self superclass]:NSObject
     age setter function pointer:0x10eb1fc3d
     */
}
@end

@interface InterviewKVOViewController ()
@property (nonatomic, strong)KVOCat *cat ;
@end

@implementation InterviewKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject *object = [[NSObject alloc]init];
    
    /*
     实现原理
     //
     */
    self.cat = [[KVOCat alloc]init];
    self.cat.name = @"cat1";
    
    //打印监听信息
    [self.cat printInfo];
    [self.cat addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [self.cat printInfo];
    
    /*
     isa:KVOCat, supper class:NSObject
     self:<KVOCat: 0x600000201bd0>,[self superclass]:NSObject
     age setter function pointer:0x10d68dfe0
     
     isa:NSKVONotifying_KVOCat, supper class:KVOCat
     self:<KVOCat: 0x600000201bd0>,[self superclass]:NSObject
     age setter function pointer:0x10eb1fc3d
     */
    //从打印结果来看，在添加了kvo时，会生成一个原先类的子类（这个子类也是通过运行时创建）
    //并为这个子类重写了setter方法,这个setter方法随后负责通知观察对象属性的改变状态
    
    
    /*
     只有遵循kvo变更属性值的方式才会执行kvo的回调方法
     例如是否执行了setter方法，或者是否使用了kvc赋值
     若果赋值没有通过setter方法或者kvc，而是直接修改属性对应的成员变量不会触发kvo机制
     所以使用kvo机制的前提是遵循Kvo的属性设置方式来变更属性值
     */
    /*
     那么是么是键值编码
     
     
     */
    
    /*
     kvo的缺点
     但是相应的在创建子类、重写方法等等方面的内存消耗是很巨大的
     */
    
    /*
     接受通知代码执行的线程，由发出通知线程决定
     */
    
    /*
     kvc的底层实现
     [self.cat setValue:@"" forKey:@"name"];
     先去检查是否存在setter,getter方法,如果不存在，它将在内部查找名_key或key的实例变量。来进行值的设置与取回
     通过kvc可以获取不存在getter方法的对象值，无需通过对象指针访问
     如果对象的实例变量为基本数据类型，我们需要对数据封装
     kvc的价值
     可以访问私有成员变量的值
     可以间接修改私有成员变量的值
     Key:只能访问当前对象的属性
     KeyPath:能利用运算符一层一层往内部访问属性
     总结：
     kvc在对象没有公开的时候，访问私有变量的一种方法
       [self.cat setValue:@"" forKey:@"name"];方法的实现是先查setter，getter方法,不存在就去找实例变量的值。
     不难看出，在实现这个方法时，用到了运行时的东西。所以这些东西是通的。我自己也可以实现键值编码。主要实现方式也是通过
     上面的方法。
     哈哈，天眼开了。
     */
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"这是object:%@,这是change:%@",object,change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.cat.name = @"耐候";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
