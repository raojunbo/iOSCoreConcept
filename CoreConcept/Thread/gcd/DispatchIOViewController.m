//
//  DispatchIOViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "DispatchIOViewController.h"
#import <pthread/pthread.h>
@interface DispatchIOViewController ()

@end

@implementation DispatchIOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     突然对GCD的内部实现有点想法
     gcd
     队列（装的任务）
     
     */
    dispatch_queue_t pipe_q = dispatch_queue_create("queue", NULL);

    //如果想提高文件的读取速度，可以尝试使用DispatchI/O
    NSString *path = [[NSBundle mainBundle]pathForResource:@"" ofType:@""];
    dispatch_fd_t fd = open(path.UTF8String, O_RDONLY, 0);//打开指定文件，并返回文件描述符号
    dispatch_io_t pipe_channel = dispatch_io_create(DISPATCH_IO_STREAM, fd, pipe_q, ^(int error) {
        close(fd);
                                                    });
    dispatch_io_set_low_water(pipe_channel, SIZE_MAX);
    //总之能进行并行计算
    
//    dispatch_io_read(pipe_channel, 0, SIZE_MAX, pipe_q, ^(bool done, dispatch_data_t  _Nullable data, int error) {
//        if(error==0){
//            size_t len = dispatch_data_get_size(data);
//            if(len > 0){
//                const char *bytes = NULL;
//                char *encoded;
//
//            }
//        }
//    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
