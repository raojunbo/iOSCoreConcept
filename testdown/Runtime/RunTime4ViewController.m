//
//  RunTime4ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/19.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RunTime4ViewController.h"
#import <objc/runtime.h>


/*
 方法的实现的替换
 */
@interface RunTime4ViewController ()

@end

@implementation RunTime4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    SEL methodSel = NSSelectorFromString(@"method1");
    BOOL result0 = class_replaceMethod([self class], @selector(method0),  class_getMethodImplementation([self class], methodSel), NULL);
    
    [self method0];
}

- (void)method0 {
    NSLog(@"这是函数名0");
}

- (void)method1 {
    NSLog(@"这是函数名1");
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
