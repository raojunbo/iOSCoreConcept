//
//  BezierPathViewController.m
//  testdown
//
//  Created by rjb on 2017/12/14.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "BezierPathViewController.h"
#import "BezierView.h"
#import "BezierView2.h"


@interface BezierPathViewController ()

@end

@implementation BezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    BezierView2 *bezierView = [[BezierView2 alloc]initWithFrame:CGRectMake(0, 0,100, 100)];
    [self.view addSubview:bezierView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
