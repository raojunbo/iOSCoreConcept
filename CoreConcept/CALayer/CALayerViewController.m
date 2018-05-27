//
//  CALayerViewController.m
//  testdown
//
//  Created by rjb on 2018/5/17.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "CALayerViewController.h"
#import "CustomCALayer.h"

@interface CALayerViewController ()<CALayerDelegate>
@property (nonatomic, strong)CustomCALayer * customLayer;
@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.customLayer = [CustomCALayer layer];
    self.customLayer.frame = CGRectMake(20, 20, 100, 100);
    self.customLayer.backgroundColor = [UIColor orangeColor].CGColor;
    self.customLayer.delegate = self;
    [self.customLayer setNeedsDisplay];
//    UIImage *image = [UIImage imageNamed:@"text2"];
//    self.customLayer.contents = CFBridgingRelease(image.CGImage);
    [self.view.layer addSublayer:self.customLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
