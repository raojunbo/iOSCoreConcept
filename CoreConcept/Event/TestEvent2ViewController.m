//
//  TestEvent2ViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/17.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "TestEvent2ViewController.h"
#import <Masonry.h>

@interface BgView:UIView

@end

@implementation BgView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    for (UIView *subView in self.subviews) {
//        if([subView isKindOfClass:[UIButton class]]){
//            NSArray *sub = subView.subviews;
//            return [sub firstObject];
//        }
//    }
    return  [super hitTest:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"我bgView处理事情");
    [super touchesBegan:touches withEvent:event];
}

@end

@interface TopView:UIView

@end
@implementation TopView
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *ss = [super hitTest:point withEvent:event];
    NSLog(@"这是%@",ss);//这里最合适的view就是topView自己
    //这里我想不通的是，为什么，
    return ss;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"我topview先处理事情");
    [super touchesBegan:touches withEvent:event];
}

@end

@interface TestEvent2ViewController ()
@property (nonatomic, strong)BgView *redBgView;
@property (nonatomic, strong)UIButton *bottomButton;
@property (nonatomic, strong)TopView *topView;
@end

@implementation TestEvent2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.redBgView];
    [self.redBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.center.equalTo(self.view);
    }];
    
    
//    [self.redBgView addSubview:self.bottomButton];
//    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(80, 80));
//        make.center.equalTo(self.view);
//    }];
//
    [self.redBgView addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.center.equalTo(self.redBgView);
    }];
}

- (BgView *)redBgView {
    if(!_redBgView){
        _redBgView = [[BgView alloc]init];
        _redBgView.backgroundColor= [UIColor redColor];
        _redBgView.userInteractionEnabled = YES;
    }
    return _redBgView;
}

- (UIButton *)bottomButton {
    if(!_bottomButton){
        _bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomButton.backgroundColor= [UIColor purpleColor];
        [_bottomButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomButton;
}

- (void)buttonClick {
    NSLog(@"点击了");
}

- (TopView *)topView {
    if(!_topView){
        _topView = [[TopView alloc]init];
        _topView.backgroundColor= [UIColor greenColor];
        _topView.userInteractionEnabled = YES;
    }
    return _topView;
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
