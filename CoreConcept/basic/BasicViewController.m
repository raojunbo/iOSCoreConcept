//
//  BasicViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/27.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     load
     +(void)load
     load方法比较特殊：装载类完毕比后，会执行“类”，“分类”的load方法，没有覆盖之说。也就是子类不会覆盖，分类不会覆盖方法
     load方法类的方法先执行，然后是分类方法，如果有多个类别都实现了load方法,其顺序是不确定的，其执行顺序与类别的编译文件列表顺序一致
     编译时的多个类，每个类load执行顺序与其在CompileSourcess顺序一致
     load方法比较特殊，不会主动调用父类的方法。
     若子类实现，或者类别实现了的话，不会覆盖父类的方法
     */
    
    /*
     initialize
     与一般的
     +(void)initialize 在第一次收到消息时调用
     父类的initialize方法会比子类先执行
     
     */
    
    
    //+load 使用的场景一般是两方法的交换
    //+initiaize 主要用来对一些不方便都在编译期初始化的对象进行赋值。
    //并且initialize值调用一次
    
    /*
     源码实现
     一是，获取了所有类后,遍历列表，将其中有+load方法的类加入loadable_class；
     二是，获取所有的类别，遍历列表，将其中有+load方法的类加入loadable_categories.
     (*load_method)(cls, SEL_load);
     这段代码也就是说+load方法的调用是通过直接使用函数内存地址的方式实现的,而不是更常见的objc_msgSend来发送消息.
     
     也正是这句代码造就了+load方法的最大特点(真的是最大的特点):
     类,父类与分类之间+load方法的调用是互不影响的.也就是,子类不会主动调用父类的+load方法,如果类与分类都实现了+load',那么两个+load`方法都会被调用.
     */
    
    /*
     这里让我联想起，进入main函数前，都做了些什么
     */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
