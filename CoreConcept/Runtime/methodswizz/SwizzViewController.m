//
//  SwizzViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/8.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "SwizzViewController.h"
#import "SwizzView.h"
#import "SwizzView+swizz.h"

@interface SwizzViewController ()

@end

@implementation SwizzViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SwizzView *swizzView = [[SwizzView alloc]init];
    [swizzView handle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
