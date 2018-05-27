//
//  TestContextViewController.m
//  testdown
//
//  Created by rjb on 2017/12/1.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestContextViewController.h"
#import "TestContextView.h"
#import "CustomOpaqueView.h"

@interface TestContextViewController ()
@property (nonatomic, strong) UIView *aView;
@property (nonatomic, strong) UIView *bView;
@property (nonnull, strong) CustomOpaqueView *contextView;
@property (nonatomic, assign) BOOL finished;
@end

@implementation TestContextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.contextView = [[CustomOpaqueView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:self.contextView];
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        while (!_finished) {
            [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
        }
    }];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)testAnimation {
    
}

@end
