//
//  TestDispatchPoollViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/5/19.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "TestDispatchPoollViewController.h"
#import "YYDispatchQueuePool.h"
#import "TestDispatchSecondViewController.h"

@interface TestDispatchPoollViewController ()
@property (nonatomic, strong) dispatch_queue_t  dispatchQueue;
@property (nonatomic, strong) UIButton *button;
@end

@implementation TestDispatchPoollViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)testboo {
    BOOL b = nil;
    if (b) {
        NSLog(@"来了");
    }else{
        NSLog(@"未来");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testboo];
    self.view.backgroundColor = [UIColor whiteColor];
    
    dispatch_queue_t mainqueue = dispatch_get_main_queue();
    //OS_dispatch_queue_main: com.apple.main-thread[0x102717b00]
    //com.apple.root.default-qos.overcommit
    
    
    dispatch_queue_t globalqueue = dispatch_get_global_queue(0, 0);
    //OS_dispatch_queue_global: com.apple.root.default-qos[0x102717f00]
    //target = [0x0]
    
    dispatch_queue_t customqueue = dispatch_queue_create("com.bestswifter.queue1", nil);
    //OS_dispatch_queue_serial: com.bestswifter.queue1[0x6000029b9800]
    //com.apple.root.default-qos.overcommit
    
    dispatch_queue_t customqueue2 = dispatch_queue_create("com.bestswifter.queue2", DISPATCH_QUEUE_CONCURRENT);
    //OS_dispatch_queue_concurrent: com.bestswifter.queue2[0x6000029b9880]
    //com.apple.root.default-qos
    
    
    //从上的信息。为什么main_queue与普通创建的queue的target是同一个;
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 100, 100, 50);
    self.button.backgroundColor = [UIColor redColor];
    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
}

- (void)buttonClick {
    TestDispatchSecondViewController *testDispatchVC = [[TestDispatchSecondViewController alloc]init];
    [self.navigationController pushViewController:testDispatchVC animated:YES];
}

@end
