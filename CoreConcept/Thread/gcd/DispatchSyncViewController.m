//
//  DispatchSyncViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "DispatchSyncViewController.h"

@interface DispatchSyncViewController ()

@end

@implementation DispatchSyncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //为什么在主线程里执行同步任务会死锁
    /*
     当前线程是主线程
     在当前线程里正在执行dispatch_sync的这个函数
     block需要等待主线程里的dispatch_sync执行完，主线程需要等待block执行完，就出现了死锁
     那么接下来，就是怎么防止死锁的问题???
     */
    //死锁的情况一
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    void(^block)(void) = ^(){
//        NSLog(@"执行到这里");
//    };
//    dispatch_sync(queue, block);
    
    
    //死锁的情况二(关键的理解是)
    dispatch_queue_t queue2 = dispatch_queue_create("queue", NULL);
    /*
     在queue2里正在执行block1的任务
     block1的任务的任务等待block1任务的结束，block1等待block1的任务结束
     就造成死锁
     */
    void(^block2)(void) = ^(){
        NSLog(@"你好");
    };
    void(^block1)(void) = ^(){
        dispatch_sync(queue2, block2);
    };
    dispatch_async(queue2, block1);
    
    //dispatch_suspend/dispatch_resume
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
