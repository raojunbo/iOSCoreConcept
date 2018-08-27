//
//  GCD2ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/21.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "GCD2ViewController.h"

/*
 GCD 核心概念:将任务添加到队列
 - 任务
     使用block 就是提前准备好的一段代码，需要的时候执行
 
 - 队列
     - 串行队列 一个任务一个任务的执行
     - 并发队列 可以同时调度多个任务
 
 - 任务执行
     任务都需要在一个线程中执行
     - 同步 当前指令不完成,不会执行下一个命令。并且不会到线程池里面取子线程
     - 异步 当前指令不完成，同样执行下一个命令。并且可能到线程池里取子线程（主线程除外）
 
 小结：
 - 开不开线程，取决于执行任务的函数，同步不开，异步开
 - 开几条线程，取决于队列，串行开一条，并发开多条
 
 //思考问题，线程队列在这里起到什么作用

 */


@interface GCD2ViewController ()

@end

@implementation GCD2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self gcdDemo2];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 主队列，同步执行
 当前在主线程，让主队列执行同步任务，就会死锁
 */
- (void)gcdDemo0 {
    /*
     死锁
     */
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}


/*
 串行队列,同步执行
 会不会开启线程呢？
 答案：任务执行方法即同步还是异步决定是否开启线程。同步执行不会开启线程
 */
- (void)gcdDemo1 {
    //1.创建串行队列
    dispatch_queue_t q = dispatch_queue_create("demo1_seral", DISPATCH_QUEUE_SERIAL);
    
    //2.同步执行任务
     for (int i =0; i< 20; i++) {
         dispatch_sync(q, ^{
        NSLog(@"demo1 %@",[NSThread currentThread]);
         });
     }
}


/*
 串行队列，异步执行
 会不会开启线程呢?
 答案：可能会创建线程
 (理解：串行队列与并行队列只是决定拿任务的方式是串行即一个一个拿任务，同步与异步执行方法决定是否开启线程去执行这个代码)
 在如下代码中
 come here 会先打印（主线程先执行完）
 */
- (void)gcdDemo2 {
    //1.创建串行队列
    dispatch_queue_t q = dispatch_queue_create("demo2_seral", DISPATCH_QUEUE_SERIAL);
    
    //2.同步执行任务
    for (int i =0; i< 20; i++) {
        dispatch_async(q, ^{
            NSLog(@"demo2+%@, %@",@(i),[NSThread currentThread]);
        });
    }
    NSLog(@"come here");
}


/*
 并发队列,异步执行
 会开启新的线程,至于开启多少个线程，不确定，由cpu决定开的线程个数
 */
- (void)gcdDemo3 {
    //1.创建串行队列
    dispatch_queue_t q = dispatch_queue_create("demo3_seral", DISPATCH_QUEUE_CONCURRENT);
    
    //2.同步执行任务
    for (int i =0; i< 20; i++) {
        dispatch_async(q, ^{
            NSLog(@"demo3+%@, %@",@(i),[NSThread currentThread]);
        });
    }
    NSLog(@"come here");
}

/*
 并发队列，同步执行
 同步执行不会开辟线程,直接在当前线程执行
 */
- (void)gcdDemo4 {
    //1.创建串行队列
    dispatch_queue_t q = dispatch_queue_create("demo4_seral", DISPATCH_QUEUE_CONCURRENT);
    //2.同步执行任务
    for (int i =0; i< 20; i++) {
        dispatch_sync(q, ^{
            NSLog(@"demo3+%@, %@",@(i),[NSThread currentThread]);
        });
    }
    NSLog(@"come here");
    /*
     demo3+0, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.908 testdown[5183:432530] demo3+1, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.909 testdown[5183:432530] demo3+2, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.909 testdown[5183:432530] demo3+3, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.909 testdown[5183:432530] demo3+4, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.909 testdown[5183:432530] demo3+5, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.910 testdown[5183:432530] demo3+6, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.910 testdown[5183:432530] demo3+7, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.910 testdown[5183:432530] demo3+8, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.910 testdown[5183:432530] demo3+9, <NSThread: 0x600000071b80>{number = 1, name = main}
     2018-05-21 14:21:56.910 testdown[5183:432530] demo3+10, <NSThread: 0x600000071b80>{number = 1, name = main}
     */
}

- (void)gcdDemo5 {
    //登录后才能,进行支付或者下载
    /*
     利用同步执行，可以实现像下面这样的线程依赖关系.
     前一个同步任务执行完后，后面的异步任务才能够开始执行
     */
    dispatch_queue_t loginQueue = dispatch_queue_create("rao-login-queue", DISPATCH_QUEUE_CONCURRENT);
    //登录(因为当前是主线程，这里是sync是同步，所以在主线程上执行)
    dispatch_sync(loginQueue, ^{
        NSLog(@"用户登录了%@",[NSThread currentThread]);
    });
    
    dispatch_async(loginQueue, ^{
        NSLog(@"用户支付了%@",[NSThread currentThread]);
    });
    
    dispatch_async(loginQueue, ^{
          NSLog(@"用户下载了%@",[NSThread currentThread]);
    });
}
/*
指定一个同步任务，让所有的异步任务，等待同步任务执行完成，就是依赖关系
 */
- (void)gcdDemo6 {
    
    dispatch_queue_t loginQueue = dispatch_queue_create("rao-login-queue", DISPATCH_QUEUE_CONCURRENT);
    void (^task)(void) = ^(){
        dispatch_sync(loginQueue, ^{
            NSLog(@"用户登录了%@",[NSThread currentThread]);
        });
        
        dispatch_async(loginQueue, ^{
            NSLog(@"用户支付了%@",[NSThread currentThread]);
        });
        
        dispatch_async(loginQueue, ^{
            NSLog(@"用户下载了%@",[NSThread currentThread]);
        });
    };
    dispatch_async(loginQueue, task);
}

/*
 全局队列
 
 ios 8.0 服务质量
 _QOS_ENUM(qos_class, unsigned int,
 QOS_CLASS_USER_INTERACTIVE     //用户交互
 __QOS_CLASS_AVAILABLE(macos(10.10), ios(8.0)) = 0x21,
 QOS_CLASS_USER_INITIATED       //用户需要的
 __QOS_CLASS_AVAILABLE(macos(10.10), ios(8.0)) = 0x19,
 QOS_CLASS_DEFAULT              //默认
 __QOS_CLASS_AVAILABLE(macos(10.10), ios(8.0)) = 0x15,
 QOS_CLASS_UTILITY              //使用工具
 __QOS_CLASS_AVAILABLE(macos(10.10), ios(8.0)) = 0x11,
 QOS_CLASS_BACKGROUND           //后台
 __QOS_CLASS_AVAILABLE(macos(10.10), ios(8.0)) = 0x09,
 QOS_CLASS_UNSPECIFIED
 __QOS_CLASS_AVAILABLE(macos(10.10), ios(8.0)) = 0x00,
 );
 

 ios 7.0
 #define DISPATCH_QUEUE_PRIORITY_HIGH 2     //高优先级
 #define DISPATCH_QUEUE_PRIORITY_DEFAULT 0  //默认优先级
 #define DISPATCH_QUEUE_PRIORITY_LOW (-2)   //优先级
 #define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN //后台优先级
 
 */
- (void)gcdDemo7 {
    /*
     第一个参数,服务质量,或者优先级
     */
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    for (int i = 0; i< 10 ; i++) {
        dispatch_async(q, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
    }
     NSLog(@"come here");
}

- (void)gcdDemo8 {
    //1.队列
    /*
     releas在mrc，创建队列需要使用，在arc中，不需要使用
     全局队列是一个并发，能开启多个线程，执行效率很高。就是比较费电
     串行队列,执行效率低
     
     */
    dispatch_queue_t q = dispatch_queue_create("RAO", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0 ; i< 10; i++) {
        dispatch_async(q, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
    }
}


@end
