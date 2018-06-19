//
//  RuntimeDynamicViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/4.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RuntimeDynamicViewController.h"
#import <objc/runtime.h>
/*
 动态方法解析与添加
 Oc的方法绘地
 objc_msgSend()
 在发送消息执行函数时，会调用IMP的函数，会默认传递给函数两个参数，id self,SEL _cmd;
 
 */

@interface DynamicPerson:NSObject

@end

@implementation DynamicPerson

/*
 当类接受到的一个没有实现的的实例方法时，会调用这个方法
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    //动态添加方法
    class_addMethod([self class], sel, (IMP)hello, "v@:");
    return [super resolveInstanceMethod:sel];
}

void hello(id obj,SEL sel,NSString *objc) {
    NSLog(@"哈哈来了%@",objc);
}

@end

@interface RuntimeDynamicViewController ()

@end

@implementation RuntimeDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DynamicPerson *person = [[DynamicPerson alloc]init];
    [person performSelector:@selector(eat) withObject:@"汉堡"];
//    objc_msgSend(p,@selector(eat:),@"汉堡");
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
