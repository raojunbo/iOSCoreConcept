//
//  DispatchSourceViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "DispatchSourceViewController.h"

@interface DispatchSourceViewController ()

@end

@implementation DispatchSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     需要知道的事dispatch_source与runloop的source有什么关系?
     我的简单理解，在一个线程的runloop里，我如果想要监听,如果能拿到当前线程的引用，就可以
     
     */
    /*
     理解：dispatch都是主动添加任务到队列中，然而当系统事件发生时，我们希望做一定的工作
     当监听到系统事件后就会触发一个任务，并自动将其加入队列执行，这里与之前手动添加任务的模式不同，一旦将Diaptach Source与Dispatch Queue关联后，只要监听到系统事件，Dispatch Source就会自动将任务（回调函数）添加到关联的队列中
     
     监听事件类型
     Dispatch Source一共可以监听六类事件，分为11个类型，我们来看看都是什么：
     
     DISPATCH_SOURCE_TYPE_DATA_ADD：属于自定义事件，可以通过dispatch_source_get_data函数获取事件变量数据，在我们自定义的方法中可以调用dispatch_source_merge_data函数向Dispatch Source设置数据，下文中会有详细的演示。
     DISPATCH_SOURCE_TYPE_DATA_OR：属于自定义事件，用法同上面的类型一样。
     DISPATCH_SOURCE_TYPE_MACH_SEND：Mach端口发送事件。
     DISPATCH_SOURCE_TYPE_MACH_RECV：Mach端口接收事件。
     DISPATCH_SOURCE_TYPE_PROC：与进程相关的事件。
     DISPATCH_SOURCE_TYPE_READ：读文件事件。
     DISPATCH_SOURCE_TYPE_WRITE：写文件事件。
     DISPATCH_SOURCE_TYPE_VNODE：文件属性更改事件。
     DISPATCH_SOURCE_TYPE_SIGNAL：接收信号事件。
     DISPATCH_SOURCE_TYPE_TIMER：定时器事件。
     DISPATCH_SOURCE_TYPE_MEMORYPRESSURE：内存压力事件。
     
     */
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    if(time){
        dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1, 1);
        dispatch_source_set_event_handler(timer, ^{
            
        });
        dispatch_resume(timer);
    }
    
    
}

dispatch_source_t processContentsOfFile(const char *fileName) {
    //prepare the file for reading
    int fd = open(fileName,O_RDONLY);
    if(fd == -1){
        return NULL;
    }
    
    fcntl(fd,F_SETFL,O_NONBLOCK);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t readSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_READ, fd, 0, queue);
    if(!readSource){
        close(fd);
        return NULL;
    }
    
    dispatch_source_set_event_handler(readSource, ^{
        
        
        
    });
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
