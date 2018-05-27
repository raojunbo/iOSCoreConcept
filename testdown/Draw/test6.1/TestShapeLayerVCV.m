//
//  TestShapeLayerVCV.m
//  testdown
//
//  Created by rjb on 2017/12/1.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestShapeLayerVCV.h"

@interface TestShapeLayerVCV ()
@property (nonatomic, strong) UIView *contentView;
@end

@implementation TestShapeLayerVCV

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:self.contentView];
    //UIBezierPath是对CoreGraphics的一个封装
    UIBezierPath * bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(175, 100)];
    [bezierPath addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:M_PI *1.5 clockwise:YES];
   
    [bezierPath moveToPoint:CGPointMake(150, 130)];
    [bezierPath addLineToPoint:CGPointMake(150, 175)];
    //但是在图层层面你只有一次机会设置这些属性。如果你想用不同颜色或风格来绘制多个形状，就不得不为每个形状准备一个图层了。
    CAShapeLayer *shapeLayer =[CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;//线条
    shapeLayer.fillColor = [UIColor greenColor].CGColor;//填充色,从路径的起始点到终止点
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;//
    shapeLayer.path = bezierPath.CGPath;
    [self.contentView.layer addSublayer:shapeLayer];
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
