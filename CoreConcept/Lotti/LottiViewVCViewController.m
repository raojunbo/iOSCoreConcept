//
//  LottiViewVCViewController.m
//  testdown
//
//  Created by rjb on 2017/12/6.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "LottiViewVCViewController.h"
#import <Lottie/Lottie.h>
@interface LottiViewVCViewController ()
@property (nonatomic,strong) LOTAnimationView *cao1AnimtaionView;
//@property (nonatomic,strong) LOTAnimationView *cao2AnimtaionView;

//@property (nonatomic,strong) LOTAnimationView *guan1AnimtaionView;
//@property (nonatomic,strong) LOTAnimationView *guan2AnimtaionView;

//@property (nonatomic,strong) LOTAnimationView *yezi1AnimtaionView;
//@property (nonatomic,strong) LOTAnimationView *yezi2AnimtaionView;

@end

@implementation LottiViewVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.cao1AnimtaionView = [LOTAnimationView animationNamed:@"cao1"];//,LottieLogo1
    self.cao1AnimtaionView.contentMode = UIViewContentModeScaleAspectFill;
    self.cao1AnimtaionView.loopAnimation = YES;
    self.cao1AnimtaionView.frame = CGRectMake(0, 60, 204/2.0, 82/2.0);
    self.cao1AnimtaionView.backgroundColor = [UIColor greenColor];
    [self.cao1AnimtaionView play];
    [self.view addSubview:self.cao1AnimtaionView];
//
//
//    self.cao2AnimtaionView = [LOTAnimationView animationNamed:@"cao2"];//,LottieLogo1
//    self.cao2AnimtaionView.contentMode = UIViewContentModeScaleAspectFill;
//    self.cao2AnimtaionView.loopAnimation = YES;
//    self.cao2AnimtaionView.frame = CGRectMake(200, 0, 88/2.0, 82/2.0);
//    self.cao2AnimtaionView.backgroundColor = [UIColor redColor];
//    [self.cao2AnimtaionView play];
//    [self.view addSubview:self.cao2AnimtaionView];
//
//    self.guan1AnimtaionView = [LOTAnimationView animationNamed:@"guang1"];//,LottieLogo1
//    self.guan1AnimtaionView.contentMode = UIViewContentModeScaleAspectFill;
//    self.guan1AnimtaionView.loopAnimation = YES;
//    self.guan1AnimtaionView.frame = CGRectMake(0, 100, 160/2.0, 270/2.0);
//    self.guan1AnimtaionView.backgroundColor = [UIColor purpleColor];
//    [self.guan1AnimtaionView play];
//    [self.view addSubview:self.guan1AnimtaionView];
//
//    self.guan2AnimtaionView = [LOTAnimationView animationNamed:@"guang2"];//,LottieLogo1
//    self.guan2AnimtaionView.contentMode = UIViewContentModeScaleAspectFill;
//    self.guan2AnimtaionView.loopAnimation = YES;
//    self.guan2AnimtaionView.frame = CGRectMake(200, 100, 80/2.0, 180/2.0);
//    self.guan2AnimtaionView.backgroundColor = [UIColor purpleColor];
//    [self.guan2AnimtaionView play];
//    [self.view addSubview:self.guan2AnimtaionView];
//
//
//    self.yezi1AnimtaionView = [LOTAnimationView animationNamed:@"yezi1"];//,LottieLogo1
//    self.yezi1AnimtaionView.contentMode = UIViewContentModeScaleAspectFill;
//    self.yezi1AnimtaionView.loopAnimation = YES;
//    self.yezi1AnimtaionView.frame = CGRectMake(0, 250, 178/2.0, 362/2.0);
//    self.yezi1AnimtaionView.backgroundColor = [UIColor orangeColor];
//    [self.yezi1AnimtaionView play];
//    [self.view addSubview:self.yezi1AnimtaionView];
//
//
//    self.yezi2AnimtaionView = [LOTAnimationView animationNamed:@"yezi2"];//,LottieLogo1
//    self.yezi2AnimtaionView.contentMode = UIViewContentModeScaleAspectFill;
//    self.yezi2AnimtaionView.loopAnimation = YES;
//    self.yezi2AnimtaionView.frame = CGRectMake(200, 250, 278/2.0, 372/2.0);
//    self.yezi2AnimtaionView.backgroundColor = [UIColor orangeColor];
//    [self.yezi2AnimtaionView play];
//    [self.view addSubview:self.yezi2AnimtaionView];
    
    
    
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
