//
//  Thread2ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/20.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Thread2ViewController.h"

@interface Thread2ViewController ()

@end

@implementation Thread2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
//    [self threademo2];
//    [self theadDemo];
}

- (void)threademo2 {
    [self performSelectorInBackground:@selector(demo2) withObject:nil];
}

- (void)theadDemo {
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(demo:) object:@"threadstr"];
    
    thread.name = @"raothrea";
    thread.threadPriority = 0;
    [thread start];
}

- (void)demo2 {
    NSLog(@"这是demo2");
}

- (void)demo:(NSString *)str {
    NSLog(@"rao:%@,%@",str,[NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
