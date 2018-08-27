//
//  ACodeViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/5.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "ACodeViewController.h"

@interface ACodeViewController ()

@end

@implementation ACodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
     有这几个问题不太明白
     */
    //1.不理解
    NSLog(@"self:%@",NSStringFromClass([self class]));
    NSLog(@"self:%@",NSStringFromClass([super class]));
    
    
    //2.动态绑定
    
    //NSProxy
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
