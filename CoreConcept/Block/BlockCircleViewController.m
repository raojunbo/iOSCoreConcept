//
//  BlockCircleViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/5/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BlockCircleViewController.h"
#import <Masonry.h>

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
    /*
     循环引用
     1.将block看做一个对象，因为block的特殊性，可以在里面引用self，而block是全局的变量时，也就是self对block引用时，
     就会造成循环的引用
     2.在block做为局部变量，对self的引用时，是不会造成的。因为，在一个函数时一个栈，在执行完后就释放block；
     3.所以对于循环引用的排查，还会从最本质的。你强引用我，我强引用你
     */
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
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.center.equalTo(self.view);
    }];
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
