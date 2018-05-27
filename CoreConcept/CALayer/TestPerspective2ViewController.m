//
//  TestPerspective2ViewController.m
//  testdown
//
//  Created by rjb on 2017/11/30.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestPerspective2ViewController.h"

@interface TestPerspective2ViewController ()
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *layer1View;
@property (nonatomic, strong) UIView *layer2View;
@end

@implementation TestPerspective2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 350, 500)];
    [self.view addSubview:self.contentView];
    
    self.layer1View = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.layer1View.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.layer1View];
    
    self.layer2View = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
    self.layer2View.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.layer2View];
    
    
    [self.contentView addSubview:self.layer1View];
    [self.contentView addSubview:self.layer2View];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/500;
    self.contentView.layer.sublayerTransform = perspective;
    //对所有子视图做透视
    
    CATransform3D tranform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);;
    self.layer1View.layer.transform = tranform1;
    
    CATransform3D transform2 =CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.layer2View.layer.transform = transform2;
    
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
