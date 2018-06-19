//
//  TestMasViewController2.m
//  CoreConcept
//
//  Created by rjb on 2018/6/1.
//  Copyright © 2018年 rjb. All rights reserved.
//


#import "TestMasViewController2.h"
#import <Masonry.h>

@interface TestMasViewController2 ()
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@end

@implementation TestMasViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.label1];
    [self.view addSubview:self.label2];
   
    /*
         1.创建了约束制造者
         2.并且绑定控件
         3.执行block
         4.让约束制造者安装约束
             1.清空了之前的约束
             2.遍历数组
     */
    
     [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(50);
    }];

    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right);
        make.centerY.equalTo(self.view.mas_centerY);
        make.left.equalTo(self.label1.mas_right).priority(999);
    }];
    
    

    //现在不明白，self.label1的内容为什么与label2设置的平齐
    
    
    /*
     这里要实现右边比左边权利更大。
     分析：
     A1:self.label2里的make.left.equteTo(self.labe1.mas_right)，self.label2在self.labe1的右边
     A2:对于label2有内容约束，有layout约束，没有设置权限时，会选择layout约束。即在label1的右边
     B:self.label1因为没有设置右边。对于lable1会选择执行内容的约束
     
     当对label2来说，可以将layout约束设置的低点，让lable2的内容吸附
     
     
     
     */
}

- (UILabel *)label1 {
    if(!_label1){
        _label1 = [[UILabel alloc]init];
        _label1.text = @"法律的理据了解";
        _label1.backgroundColor = [UIColor redColor];
    }
    return _label1;
}

- (UILabel *)label2 {
    if(!_label2){
        _label2  = [[UILabel alloc]init];
        _label2.text =@"家里附近的朗放量技术分类；设计费";
        _label2.backgroundColor = [UIColor greenColor];
    }
    return _label2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
