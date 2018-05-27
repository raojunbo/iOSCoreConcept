//
//  GCD4ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/22.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "GCD4ViewController.h"

@interface GCD4ViewController ()

@end

@implementation GCD4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self gcdDemo1];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gcdDemo1 {
    /*
     死锁
     */
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}

- (void)groupDemo1 {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("rao-queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_async(group, queue, ^{
        NSLog(@"down load1%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"down load2%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
         NSLog(@"down load3%@",[NSThread currentThread]);
    });
    
    //当前面的所有
    dispatch_group_notify(group, queue, ^{
        NSLog(@"所有的都执行完%@",[NSThread currentThread]);
    });
    
    //在主队列里进行更新
    dispatch_group_notify(group,dispatch_get_main_queue(), ^{
        NSLog(@"所有的都执行完%@",[NSThread currentThread]);
    });
}


@end
