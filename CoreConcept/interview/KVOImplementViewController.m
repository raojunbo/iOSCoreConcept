//
//  KVOImplementViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/5.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "KVOImplementViewController.h"
#import "NSObject+RAO2KVC.h"

@interface JUNDog:NSObject
@property(nonatomic, strong)NSString *name;
@end

@implementation JUNDog

@end

@interface KVOImplementViewController ()
@property (nonatomic, strong)JUNDog *junDog;
@property (nonatomic, strong)UIButton *button;
@end

@implementation KVOImplementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.junDog = [[JUNDog alloc]init];
    [self.junDog RAO_addObserver:self  forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 100, 200, 30);
    self.button.backgroundColor = [UIColor redColor];
    [self.button addTarget:self action:@selector(buttClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
}

- (void)buttClick {
    self.junDog.name = @"wo";
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"这是改变%@",change);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
