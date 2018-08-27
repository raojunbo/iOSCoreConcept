//
//  BlockTestViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BlockTestViewController.h"

@interface BlockTestViewController ()

@end

@implementation BlockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     block捕获变量后，就是__NSMallocBlock__
     捕获的变量是对象时，捕获的是变量的地址
     捕获的变量是一般值时，捕获的是值
     */
    
     __weak void(^block0)(void)= ^(){
        
    };
    NSLog(@"block0%@",block0);
    
    void(^block1)(void) = ^(){
       
    };
     NSLog(@"block1%@",block1);
    
    //捕获变量就复制到堆上
    int a = 0;
    void(^block2)(void) = ^(){
        NSLog(@"这是a%@",a);
    };
     NSLog(@"block2%@",block2);
    
    
    __block int b = 0;
    void(^block3)(void)  = ^(){
        b= 2;
    };
    NSLog(@"block2%@",block3);

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
