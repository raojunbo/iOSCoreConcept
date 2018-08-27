//
//  InterViewMessageViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/5.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "InterViewMessageViewController.h"
#import <objc/message.h>

@interface MessagePerson:NSObject
@property (nonatomic, strong)NSString *name;
@end

@implementation MessagePerson

@end

@interface InterViewMessageViewController ()
@property (nonatomic, strong)MessagePerson *person;
@end

@implementation InterViewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //objc 向一个对象发送消息，都发生了什么
    /*
     调用obj_msgSend
     通过isa指针找到了类对象
     类对象在里它的cache方法列表里寻找方法的实现
     没有找到则在methodlist寻找
     没有找到，则通过super在父类类对象里面寻找
     知道找到为止
     没有找到，就会走类的动态方法解析，看是否动态添加了方法
     动态解析没有添加，则看是否是处理的其他对象。
     如果没有，就走完整的转发流程。
     如果没有就奔溃啊。
     */
    
    objc_msgSend([self.person class], @selector(alloc));
 
    
    //我在这里修改这个东西1
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //修改bug2
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
