//
//  GCDViewController.m
//  testdown
//
//  Created by rjb on 2018/5/21.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self gcdDemo3];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 线程间的通信
 */
- (void)gcdDemo3 {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"全局队列%@",[NSThread currentThread]);
    });
    
    //在主队列里执行异步的任务，会造成什么后果。
    //主队列里是不会异步开启子线程的
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"UI更新%@",[NSThread currentThread]);
    });
}

/*
 异步执行（异步时开启线程的条件）
 如果任务没有执行完，可以不用等待，异步执行下一个任务。具备开启线程的能力。
 */
- (void)gcdDemo2 {
    //创建队列(并发队列)
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    //任务添加到队列中
    void (^task)() = ^{
        NSLog(@"%@",[NSThread currentThread]);
    };
    
    //添加任务到队列
    //异步
    dispatch_async(q, task);
}

/*
 同步执行任务是不会开启子线程的
 */
- (void)gcdDemo1 {
    //创建队列(并发队列)
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);

    //任务添加到队列中
    void (^task)() = ^{
        NSLog(@"%@",[NSThread currentThread]);
    };

    //添加任务到队列
    //同步执行任务
    dispatch_sync(q, task);

}

@end
