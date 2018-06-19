//
//  RuntimeKVOCustomViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/4.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RuntimeKVOCustomViewController.h"
#import "NSObject+RAOKVO.h"
@interface KVOPerson:NSObject
@property (nonatomic, strong)NSString *name;
@end

@implementation KVOPerson

@end

@interface RuntimeKVOCustomViewController ()
@property (nonatomic, strong)KVOPerson *person;
@end

@implementation RuntimeKVOCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [[KVOPerson alloc]init];
    [self.person rao_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"来了");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person.name = @"fldj j";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
