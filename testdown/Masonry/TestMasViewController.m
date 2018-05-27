//
//  TestMasViewController.m
//  testdown
//
//  Created by rjb on 2018/3/21.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "TestMasViewController.h"
#import "Masonry.h"
#import <AFNetworking.h>


@interface CustomView : UIView
@property (nonatomic, strong) UIView *redView;
@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    [self addSubview:self.redView];
  
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.superview);
        make.width.mas_equalTo(self.redView);
        make.height.mas_equalTo(self.redView);
        make.centerY.mas_equalTo(200);
        make.centerX.mas_equalTo(100);
    }];
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

@end

@interface TestMasViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) CustomView *blueView;
@end

@implementation TestMasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.blueView.autoresizesSubviews = YES;
    [self.view addSubview:self.blueView];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(10);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (CustomView *)blueView {
    if (!_blueView) {
        _blueView = [[CustomView alloc] init];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}

@end
