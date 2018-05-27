//
//  DrawVC.m
//  testdown
//
//  Created by rjb on 2017/11/25.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "DrawVC.h"
@interface DrawVC ()
@property (nonatomic,strong) UIBezierPath *path;
@end

@implementation DrawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    DrawView2 *drawView = [[DrawView2 alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
//    [self.view addSubview:drawView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
