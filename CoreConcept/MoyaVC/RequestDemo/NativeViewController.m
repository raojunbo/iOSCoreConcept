//
//  NativeViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/7/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "NativeViewController.h"
#import "CoreConcept-Swift.h"

@interface NativeViewController ()
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) MOJIHttpCancelableToken *cancleObject;
@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我是Native页面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 64, 100, 50);
    self.button.backgroundColor = [UIColor redColor];
    [self.button setTitle:@"Object-C" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(testButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)dealloc
{
    if(self.cancleObject){
        [self.cancleObject cancel];
    }
    
}

- (void)testButtonClick {
    //调用Swift的网络请求
    self.cancleObject = [UserCenterHttpInterface requtstUserProfileWithUserName:@"raojunbo" complete:^(NSString * result) {
        NSLog(result);
    }];
    
}

@end
