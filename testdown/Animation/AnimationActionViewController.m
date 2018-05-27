//
//  AnimationActionViewController.m
//  testdown
//
//  Created by rjb on 2018/5/17.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "AnimationActionViewController.h"
#import "AnimationActionView.h"

@interface AnimationActionViewController ()
@property (nonatomic,strong) AnimationActionView *animationActionView;
@property (nonatomic,strong) UIButton *button;
@end

@implementation AnimationActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.animationActionView.backgroundColor = [UIColor purpleColor];
    self.animationActionView.frame = CGRectMake(100, 100, 50, 50);
    [self.view addSubview:self.animationActionView];
    
    self.button.frame = CGRectMake(0, 0, 40, 40);
    self.button.backgroundColor = [UIColor greenColor];
    [self.button setTitle:@"点击我啊" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (AnimationActionView *)animationActionView {
    if(!_animationActionView){
        _animationActionView = [[AnimationActionView alloc]init];
    }
    return _animationActionView;
}

- (UIButton *)button {
    if(!_button){
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(buttonCClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)buttonCClick {
     self.animationActionView.frame = CGRectMake(100, 100, 300, 300);
}

@end
