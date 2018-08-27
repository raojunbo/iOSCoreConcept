//
//  OperationCustomViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/1.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "OperationCustomViewController.h"
#import "CustomOperation.h"
@interface OperationCustomViewController ()
@property (nonatomic, strong)NSOperationQueue *queue;
@end

@implementation OperationCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.queue = [[NSOperationQueue alloc]init];
    CustomOperation *operation  = [[CustomOperation alloc]init];
    [self.queue addOperation:operation];
    [operation start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
