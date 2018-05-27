//
//  TestContextLineViewController.m
//  testdown
//
//  Created by rjb on 2017/12/2.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestContextLineViewController.h"
#import "ContextLineWidthView.h"

@interface TestContextLineViewController ()
@property (nonatomic, strong) ContextLineWidthView *contextLineView;
@end

@implementation TestContextLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.contextLineView = [[ContextLineWidthView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:self.contextLineView];
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
