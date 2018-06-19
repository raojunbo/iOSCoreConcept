//
//  TestTimeOffsetViewController.m
//  testdown
//
//  Created by rjb on 2017/11/23.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestTimeOffsetViewController.h"

@interface TestTimeOffsetViewController ()
@property (nonatomic, strong) UISlider *speedSlider;
@property (nonatomic, strong) CALayer  *shipLayer;
@property (nonatomic, strong) UIBezierPath *path;
@end

@implementation TestTimeOffsetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.path =[[UIBezierPath alloc]init];
    [ self.path  moveToPoint:CGPointMake(0, 150)];
    [ self.path  addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path =  self.path .CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.lineWidth = 3.0;
    [self.view.layer addSublayer:shapeLayer];
    
    
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 64, 64);
    self.shipLayer.position = CGPointMake(0, 150);
    self.shipLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"chat"].CGImage);
    [self.view.layer addSublayer:self.shipLayer];
    
    
    CACurrentMediaTime();
    
}

-(void)buttonClick{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.timeOffset = 2.5;
    animation.speed = 1;
    animation.duration = 5;
    animation.path = self.path.CGPath;
    animation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = NO;
    [self.shipLayer addAnimation:animation forKey:@"jj"];
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
