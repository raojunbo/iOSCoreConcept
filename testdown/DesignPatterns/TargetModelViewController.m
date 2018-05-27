//
//  TargetModelViewController.m
//  testdown
//
//  Created by rjb on 2017/12/12.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TargetModelViewController.h"
#import "ButtonView.h"
@interface TargetModelViewController ()

@end

@implementation TargetModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ButtonView * buttonView = [[ButtonView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    [self.view addSubview:buttonView];
    buttonView.backgroundColor = [UIColor greenColor];
    [buttonView addTarget:self action:@selector(buttonClick)];
    // Do any additional setup after loading the view.
}
- (void)buttonClick{
    NSLog(@"点击了");
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
