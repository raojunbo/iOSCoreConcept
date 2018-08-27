//
//  GCDDispatchGroupVc.m
//  CoreConcept
//
//  Created by rjb on 2018/6/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "GCDDispatchGroupVc.h"

@interface GCDDispatchGroupVc ()

@end

@implementation GCDDispatchGroupVc

- (void)viewDidLoad {
    [super viewDidLoad];
//    原因就是  对于最低sdk版本>=ios6.0来说,GCD对象已经纳入了ARC的管理范围
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    
    dispatch_group_t group = dispatch_group_create();
    
    //指定队列里的哪些任务进行分组
    dispatch_group_async(group, queue, ^{
        NSLog(@"block1");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"block2");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"block3");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"block4");
    });
    
    //当组里的内容执行完后
    dispatch_group_notify(group, queue, ^{
        NSLog(@"都执行完了");
    });
    
    
    //dispatch_after,在当前时间执行之后，进行调用
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
    //dispatch_barrie_async
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
