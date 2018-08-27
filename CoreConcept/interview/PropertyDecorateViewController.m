//
//  PropertyDecorateViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/4.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "PropertyDecorateViewController.h"

@interface SuperPerson:NSObject
@property (nonatomic, strong)NSString *name;
@end

@implementation SuperPerson
- (void)setName:(NSString *)name {
    _name = name;
}
@end

@interface SubPerson:SuperPerson

@end

@implementation SubPerson
@dynamic name;

@end

@interface PropertyDecorateViewController ()

@end

@implementation PropertyDecorateViewController

- (void)dealloc {
    NSLog(@"释放了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    SubPerson *sub = [[SubPerson alloc]init];
    sub.name = @"jun";
    NSLog(@"这是person%@",sub.name);
    
    //vc不持有block
    //block持有vc
    //--->当然不会循环引用
    [UIView animateWithDuration:1 animations:^{
        self.view.backgroundColor = [UIColor whiteColor];
    }];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.view.backgroundColor = [UIColor redColor];
    });
}

- (void)setAge:(NSString *)age {
    age = @"20";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static void raotext(){
    NSLog(@"这是什么");
}

@end
