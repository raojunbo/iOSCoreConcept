//
//  TestLayerViewController.m
//  testdown
//
//  Created by rjb on 2017/11/29.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestLayerViewController.h"

@interface TestLayerViewController ()
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *blueLayer;
@property (nonatomic, strong) CALayer *greenLayer;
@end

@implementation TestLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layerView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    self.layerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.layerView];
    
    self.blueLayer  = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50, 50, 100, 100);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer  addSublayer:self.blueLayer];
    
    self.greenLayer = [CALayer layer];
    self.greenLayer.frame= CGRectMake(70, 70, 100, 100);
    self.greenLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.layerView.layer addSublayer:self.greenLayer];
    
    self.blueLayer.zPosition = 1.0;
    self.greenLayer.zPosition = 0.0;
//    self.layerView.layer.zPosition = 0.0;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject]locationInView:self.view];
    CALayer *layer = [self.layerView.layer hitTest:point];
    if (layer==self.blueLayer) {
       UIAlertView *alertView =  [[UIAlertView alloc]initWithTitle:@"" message:@"blueLayer" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }else if(layer==self.greenLayer){
        UIAlertView *alertView =  [[UIAlertView alloc]initWithTitle:@"" message:@"greenLayer" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }else{
        UIAlertView *alertView =  [[UIAlertView alloc]initWithTitle:@"" message:@"layerView.layer" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
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
