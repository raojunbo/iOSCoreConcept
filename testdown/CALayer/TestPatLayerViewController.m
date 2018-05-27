//
//  TestPatLayerViewController.m
//  testdown
//
//  Created by rjb on 2017/11/30.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestPatLayerViewController.h"

@interface TestPatLayerViewController ()
@property (nonatomic, strong) UIView *outerView;
@property (nonatomic, strong) UIView *innerView;
@end

@implementation TestPatLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.outerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.outerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.outerView];
    
    
    self.innerView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.innerView.backgroundColor = [UIColor greenColor];
    [self.outerView addSubview:self.innerView];
    
    CATransform3D pers = CATransform3DIdentity;
    pers.m34 = -1.0 / 500.0;
    
    
    CATransform3D tranform = CATransform3DRotate(pers, M_PI_4, 0, 1, 0);
    self.outerView.layer.transform = tranform;
    
    //在这里可以理解，CATransform3D并不是真正的3D
//    CATransform3D innnerTranfrom =  CATransform3DRotate(pers, -M_PI_4, 0, 1, 0);
//    self.innerView.layer.transform = innnerTranfrom;
    
    
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
