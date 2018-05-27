//
//  OperationViewController.m
//  testdown
//
//  Created by rjb on 2018/5/22.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "OperationViewController.h"

/*
 NSOperation：核心概念，将"操作"添加到队列
 GCD:将“任务”添加到队列
 NSOperation:抽象类
 特点
 不能直接使用,必须用子类
 子类
 NSInvocationOperation
 NSBlockOperation

 NSOperation:苹果大力推荐,核心，将操作添加到队列
 gcd 将任务添加到队列
 
 NSOperation 和GCD对比
 GCD 在iOS 4.0 推出 主要多核处理器优化的并发技术
     将任务block添加到队列(串行，并行，主队列，全局队列),并且要值定任务的同步,异步
     提供了一些NSOperation不具备的功能
         如一次执行,延时执行，调度组
 
 NSOperation 在ios 2.0出来,GCD后又进行重写
     将操作异步执行的任务添加并发队列，就会立刻异步执行
     提供一些gcd实现起来比较麻烦的功能
     - 最大并发线程
     - 队列的暂停，继续
     - 取消所有线程
     - 线程的依赖(线程A的执行必须依赖线程B)
 */

@interface OperationViewController ()
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation OperationViewController

- (NSOperationQueue *)queue {
    if(!_queue){
        _queue = [[NSOperationQueue alloc]init];
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo7];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)demo7 {
    self.queue.maxConcurrentOperationCount = 2;
    /*
     底层的线程池更大了，能够拿到更多的线程资源
     多线程同时并发线程数,要求更到了
     */
    
    //设置同时的最大的并发数量
    for (int i = 0; i< 20; i++) {
        [self.queue addOperationWithBlock:^{
            NSLog(@"%@----%d",[NSThread currentThread],i);
        }];
    }
    
}

- (void)demo6 {
    [self.queue addOperationWithBlock:^{
        NSLog(@"---%@",[NSThread currentThread]);
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            NSLog(@"--%@",[NSThread currentThread]);
        }];
    }];
}

- (void)demo3 {
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    for (int i = 0; i<10; i++) {
        NSBlockOperation *bp = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"%@----%d", [NSThread currentThread],i);
        }];
        [queue addOperation:bp];
    }
}

- (void)demo2 {
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    //默认的事GCD的并发操作
    //默认是异步执行任务
    for (int i = 0; i<10; i++) {
        NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(downImage:) object:[NSString stringWithFormat:@"字符%d",i]];
        [queue addOperation:op];
    }
}

- (void)demo1 {
    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(operate) object:@"invocation"];
    
    //创建队列
    NSOperationQueue *oprationQueue = [[NSOperationQueue alloc]init];
    
    //将操作加入到队列中
    [oprationQueue addOperation:op];
}

- (void)downImage:(NSString *)imageStr {
    NSLog(@"这是%@",imageStr);
}

- (void)operate{
  
    NSLog(@"执行了%@",  [NSThread currentThread]);
}

@end
