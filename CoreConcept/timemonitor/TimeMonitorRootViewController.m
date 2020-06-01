//
//  TimeMonitorRootViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/4/22.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "TimeMonitorRootViewController.h"
#import "TimeMonitorViewController.h"
@interface TimeMonitorRootViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation TimeMonitorRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.backgroundColor = [UIColor redColor];
    self.button.frame = CGRectMake(0, 64, 100, 50);
    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)buttonClick {
    TimeMonitorViewController *timeMonitorVC = [[TimeMonitorViewController alloc]init];
    [self.navigationController pushViewController:timeMonitorVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
