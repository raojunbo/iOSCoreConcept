//
//  TestTranformViewController.m
//  testdown
//
//  Created by rjb on 2017/11/30.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestTranformViewController.h"

@interface TestTranformViewController ()
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) UIView *layerView2;
@property (nonatomic, strong) UIView *layerView3;
@end

@implementation TestTranformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.layerView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.layerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.layerView];
    
    self.layerView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.layerView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.layerView2];
    
    self.layerView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    self.layerView3.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.layerView3];
    
    CGAffineTransform tranform = CGAffineTransformIdentity;
    tranform = CGAffineTransformTranslate(tranform, 200, 0);//移动200
    tranform = CGAffineTransformScale(tranform, 0.5, 0.5);//缩放0.5
    tranform = CGAffineTransformRotate(tranform, M_PI_4);//旋转45
    self.layerView2.layer.affineTransform = tranform;//
    
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
