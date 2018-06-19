//
//  RuntimeMessageViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/4.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RuntimeMessageViewController.h"
#import <objc/message.h>
/*
 消息机制
 */

@interface RaoPerson:NSObject

@end

@implementation RaoPerson

@end

@interface Person:NSObject
- (void)eat ;
@end

@implementation Person
- (void)eatWith:(NSString *)foot {
    NSLog(@"%@",foot);
}
- (void)eat {
    NSLog(@"吃");
}

@end

@interface RuntimeMessageViewController ()

@end

@implementation RuntimeMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)demo1 {
    //    Person *person  = [[Person alloc]init];
    /*
     费曼法则
     alloc是类方法，发送消息时，实际是向类对象发送消息
     SEL方法编号
     */
    /*
     NSClassFromString(@"Person") 实际就是一种反射机制，将字符串转成成类对象。然后对此执行其他操作。
     在与后端的调配中很有作用
     */
    //    objc_getClass("Person")  相当于 NSClassFromString(@"Person")
    //    @selector(alloc)  相当于 sel_registerName("alloc") 注册生成sel，方便快速访问
    
    Person *person = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));//向类对象发送消息
    person = objc_msgSend(person, @selector(init));//向实例对象发送消息
    objc_msgSend(person, @selector(eat));
    objc_msgSend(person, @selector(eatWith:),@"汉堡");
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
