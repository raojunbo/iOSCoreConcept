//
//  GCDBarrierViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "GCDBarrierViewController.h"

@interface GCDBarrierViewController ()

@end

@implementation GCDBarrierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //我很想知道dispatch_queue_t的数据结构
    
    dispatch_queue_t queue = dispatch_queue_create("label", DISPATCH_QUEUE_CONCURRENT);
    static NSInteger readCount = 0;
    void(^read)(void) = ^() {
        NSLog(@"这是read%@",@(readCount));
      
    };
    void(^write)(void) = ^(){
        readCount++;
        NSLog(@"这是write%@",@(readCount));
        
    };
    
    dispatch_async(queue, read);
    dispatch_async(queue, read);
    dispatch_async(queue, read);
    dispatch_async(queue, read);
    
    dispatch_barrier_async(queue, write);
    
    dispatch_async(queue, read);
     dispatch_async(queue, read);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
