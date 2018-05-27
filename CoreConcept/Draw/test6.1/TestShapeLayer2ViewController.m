//
//  TestShapeLayer2ViewController.m
//  testdown
//
//  Created by rjb on 2017/12/1.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestShapeLayer2ViewController.h"

@interface TestShapeLayer2ViewController ()

@end

@implementation TestShapeLayer2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = CGRectMake(50, 50, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corner = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radii];
    
    //create path
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
