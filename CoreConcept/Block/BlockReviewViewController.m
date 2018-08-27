//
//  BlockReviewViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/5.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BlockReviewViewController.h"

@interface BlockReviewViewController ()

@end

@implementation BlockReviewViewController

+(void)load {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     block分类
     NSGlobalBlock
     NSMallockBlock
     NSStackBlock
     */
    //修改外部变量,将栈区copy到堆区。由于栈区空间比较小只有2M
   
    __block int a = 10;
     NSLog(@"前%p",&a);
    void (^block)(void) = ^(){
        a += 10;
        NSLog(@"a=%d",a);
    };
     NSLog(@"后%p",&a);
    
    
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
