//
//  TestViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/9/12.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "TestViewController.h"

static NSString *const testConst = @"e";

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"这是取在别处定义的字符串%@",testConst);
}
- (void)te {
    
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
