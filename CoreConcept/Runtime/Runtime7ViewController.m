//
//  Runtime7ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/19.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Runtime7ViewController.h"
#import "RuntimePerson2.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface Runtime7ViewController ()

@end

@implementation Runtime7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RuntimePerson2 *pp = [[RuntimePerson2 alloc]init];
    [pp performSelector:@selector(dodo) withObject:@"汉堡"];
    
    objc_msgSend(pp, @selector(dodo),@"汉堡");
}

- (void)dodo {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
