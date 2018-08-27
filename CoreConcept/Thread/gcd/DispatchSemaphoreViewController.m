//
//  DispatchSemaphoreViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "DispatchSemaphoreViewController.h"

@interface DispatchSemaphoreViewController ()

@end

@implementation DispatchSemaphoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     iOS里: NSMutableArray是线程不安全的，当有多个线程同时对数组进行操作的时候可能导致崩溃或数据错误
     那么这种线程不安全，采用什么补救措施

     */
    //并发写入数据
    dispatch_queue_t queue  = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);//创建信号量
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0 ; i<1000; i++) {
        dispatch_async(queue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);//减少信号量
            [array addObject:@(i)];
        });
        dispatch_semaphore_signal(semaphore);//提高信号量
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //在多线程角度，保留一份代码值执行一次
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
