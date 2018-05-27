//
//  TestPerspectiveViewController.m
//  testdown
//
//  Created by rjb on 2017/11/30.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestPerspectiveViewController.h"

@interface TestPerspectiveViewController ()
@property (nonatomic, strong) UIView * perspectView1;
@property (nonatomic, strong) UIView * perspectView2;
@end

@implementation TestPerspectiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.perspectView1  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.perspectView1.backgroundColor  = [UIColor greenColor];
    self.perspectView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.perspectView2.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.perspectView1];
    [self.view addSubview:self.perspectView2];
    
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = -1.0/500.0;
    transform1 = CATransform3DRotate(transform1, M_PI_4, 0, 1, 0);
    
    
    CATransform3D transform2 = CATransform3DIdentity;
    transform2.m34 = 1.0/500.0;
    transform2 = CATransform3DRotate(transform2, M_PI_4, 0, 1, 0);
    
    self.perspectView1.layer.transform = transform1;
    self.perspectView2.layer.transform = transform2;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
