//
//  BlockCircleViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/5/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BlockCircleViewController.h"


@interface BlockCircleViewController ()
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)void(^raoBlockA)(void);
@property (nonatomic, assign)int b;

@end

@implementation BlockCircleViewController

- (void)dealloc {
    NSLog(@"销毁了吗");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak typeof  (self) tmpself = self;
    NSLog(@"这是self:%@",self);
    NSLog(@"这是tmpself:%@",tmpself);
    self.raoBlockA = ^(){
        tmpself.b = 2;
        NSLog(@"这是raoBlockA:%@",@(tmpself.b));
        NSLog(@"这是raoBlockA:%@",tmpself);
    };
    self.raoBlockA();
   
    void(^raoBlockB)(void) = ^(){
        self.b = 3;
    };
    raoBlockB();
    
    [self.view addSubview:self.button];
   
}



- (UIButton *)button {
    if(!_button){
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"button" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        _button.backgroundColor = [UIColor redColor];
    }
    return _button;
}

- (void)pop {
    if(self.backBlock){
        self.backBlock(self.raoBlockA);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
