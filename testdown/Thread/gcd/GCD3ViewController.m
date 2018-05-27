//
//  GCD3ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/21.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "GCD3ViewController.h"

/*
 gcd延时处理
 */

@interface GCD3ViewController ()

@end

@implementation GCD3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    dispatch_time_t tim = dispatch_time(DISPATCH_TIME_NOW,  (int64_t)(1.0 * NSEC_PER_SEC));
//    dispatch_after(tim, dispatch_get_main_queue(), ^{
//
//    });
    [self testOnce];
}

- (void)testOnce {
    for (int i = 0; i< 10; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self once];
        });
    }
}

- (void)once {
    /*
     能保证多线程单例的安全
     */
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"执行了");
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
