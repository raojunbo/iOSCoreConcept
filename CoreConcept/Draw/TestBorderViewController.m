//
//  TestBorderViewController.m
//  testdown
//
//  Created by rjb on 2017/11/29.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestBorderViewController.h"

@interface TestBorderViewController ()
@property (nonatomic,strong) UIView *layerView;
@property (nonatomic,strong) UIView *layerView2;
@end

@implementation TestBorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.layerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.layerView];
    
    //view 内扩
    //shaperLayer lineWidth 两边扩
    /*
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 10;
    layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 100, 100, 100)].CGPath;
    [self.view.layer addSublayer:layer];
     */
    
//    UIView *view2 = [UIView new];
//    view2.frame = CGRectMake(0, 100, 100, 100);
//    view2.backgroundColor = [UIColor redColor];
//    view2.layer.cornerRadius = 50;
//    view2.layer.borderWidth = 10;
//    view2.layer.borderColor = [UIColor blueColor].CGColor;
//    [self.view addSubview:view2];
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
