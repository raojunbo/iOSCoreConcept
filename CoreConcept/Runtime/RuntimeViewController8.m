//
//  RuntimeViewController8.m
//  CoreConcept
//
//  Created by rjb on 2018/9/2.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RuntimeViewController8.h"

@interface RuntimeViewController8 ()

@end

@implementation RuntimeViewController8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //类型编码
    float a[] = {1,2,3};
    NSLog(@"array encoding type:%s",@encode(typeof(a)));
    
    NSString *str = @"你好";
    NSLog(@"string encoding type:%s",@encode(typeof(str)));

    CGFloat ff = 2.0;
    NSLog(@"string encoding type:%s",@encode(typeof(ff)));

    
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
