//
//  RootViewController.m
//  testdown
//
//  Created by rjb on 2017/10/11.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "RootViewController.h"
#import "AFNetworking.h"
#import "BlockViewController.h"
@interface RootViewController ()
@property (nonatomic, strong)BlockViewController *blockvc;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 50 );
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(downClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0);
    
}

-(void)downClick{
    //block捕获self.
    //当self幷不拥有block
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:self.blockvc animated:YES];
    });
    
    [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timeTick) userInfo:nil repeats:YES];
    
}

- (void)timeTick {
    
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
