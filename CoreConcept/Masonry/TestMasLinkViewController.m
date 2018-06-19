//
//  TestMasLinkViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/17.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "TestMasLinkViewController.h"

@interface LinkObject:NSObject

-(LinkObject *(^)(NSInteger))rao;//实现一个get方法,这个get返回一个block,这个block执行后返回的是对象本身

@end

@implementation LinkObject

- (LinkObject *(^)(NSInteger))rao {
    return ^LinkObject *(NSInteger parm){
        return self;
    };
}



@end

@interface TestMasLinkViewController ()

@end

@implementation TestMasLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LinkObject *linkObject  = [[LinkObject alloc]init];
    linkObject.rao(10).rao(20);
    
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
