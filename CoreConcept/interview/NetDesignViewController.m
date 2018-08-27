//
//  NetDesignViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/6.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "NetDesignViewController.h"
#import "CopyingViewController.h"

@interface NetRequest:NSObject

+(void)requestFor:(void(^)(NSString *json))block;

@end

@implementation NetRequest

+(void)requestFor:(void(^)(NSString *json))block {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(block){
            block(@"回来了");
        }
    });
}

@end

@interface NetDesignViewController ()

@end

@implementation NetDesignViewController

- (void)dealloc
{
    NSLog(@"NetDesignViewController释放了吗");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"马上开始请求了");
    [NetRequest requestFor:^(NSString *json) {
        CopyingViewController *copyVC = [[CopyingViewController alloc]init];
        [self.navigationController pushViewController:copyVC animated:YES];
         NSLog(@"请求回来了");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
