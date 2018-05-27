//
//  ThreadViewController.m
//  testdown
//
//  Created by rjb on 2018/5/20.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "ThreadViewController.h"
#import <pthread.h>

@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self pthreadDemo];
}

- (void)pthreadDemo {
    NSString *str = @"cc";
    pthread_t threadId;
    /*
     1.指向线程的指针
     2.线程属性
     3.指向函数的指针
     4.传递给函数的参数
     返回值：特别在C语言框架
     如果0，表示正确
     如果是非0，表示错误码
     */
    int result = pthread_create(&threadId, NULL, &demo, (void *)CFBridgingRetain(str));
    
    if(result == 0){
        NSLog(@"创建正确");
    }else{
        NSLog(@"创建错误");
    }
}

/*
 void *  (*)  (void *)
 void *  demo   (void *parma)
 返回值  函数指针 参数
 */
void *demo(void *param){
    //子线程
    NSLog(@"%@,%@",[NSThread currentThread],param);
    return NULL;
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
