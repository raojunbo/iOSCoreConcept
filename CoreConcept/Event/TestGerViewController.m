//
//  TestGerViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "TestGerViewController.h"

@interface CustomScrollView:UIScrollView

@end

@implementation CustomScrollView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesCancelled");
}

@end

@interface TestGerViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)CustomScrollView *scrollView;
@end

@implementation TestGerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
}

- (UIScrollView *)scrollView {
    if(!_scrollView){
        _scrollView = [[CustomScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 200);
    }
    return _scrollView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
