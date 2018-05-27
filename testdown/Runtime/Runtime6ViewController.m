//
//  Runtime6ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/19.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Runtime6ViewController.h"
#import "RuntimePerson.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface Runtime6ViewController ()

@end

@implementation Runtime6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     发送消息alloc
     objc_class 去执行
     mmalloc()
     */
    //  RuntimePerson *p = [[RuntimePerson alloc]init];
    //  alloc是类方法,会向类的“类对象（元类）”发送消息。
    //SEL 方法编号
    RuntimePerson *p = objc_msgSend([RuntimePerson class], @selector(alloc));
    p = objc_msgSend(p, @selector(init));
    [p eat];
    objc_msgSend(p, sel_registerName("eatFoot:"),@"汉堡");
    
//
//    //相应的底层实现
//    Class pClass = objc_getClass("RuntimePerson");
//    RuntimePerson *pp  = objc_msgSend(pClass, sel_registerName("alloc"));
//    pp = objc_msgSend(pp, sel_registerName("init"));
//    [pp eat];
    // Do any additional setup after loading the view.
    
    
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
