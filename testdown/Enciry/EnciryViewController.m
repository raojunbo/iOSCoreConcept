//
//  EnciryViewController.m
//  testdown
//
//  Created by rjb on 2018/3/18.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "EnciryViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface EnciryViewController ()

@end

@implementation EnciryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    LAContext *context = [[LAContext alloc]init];
    
    [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil];
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请验证" reply:^(BOOL success, NSError * _Nullable error) {
        if(success){
            NSLog(@"验证成功");
        }else{
            
        }
    }];
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
