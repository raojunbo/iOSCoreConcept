//
//  Test22ViewController.m
//  testdown
//
//  Created by rjb on 2017/11/29.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "Test22ViewController.h"
#import "DrawView22.h"
@interface Test22ViewController ()
@property (nonatomic, strong)DrawView22 *drawView22;
@end

@implementation Test22ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drawView22 = [[DrawView22 alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:self.drawView22];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
