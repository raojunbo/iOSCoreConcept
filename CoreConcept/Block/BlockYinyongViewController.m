//
//  BlockYinyongViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/29.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BlockYinyongViewController.h"

@interface BlockYinyongViewController ()
@property (nonatomic, strong)NSMutableArray *operationArray;
@end

@implementation BlockYinyongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.operationArray = [[NSMutableArray alloc]init];
    
    void(^block1)(void)= ^(){
        NSLog(@"执行1");
    };
    void(^block2)(void) = ^(){
        NSLog(@"执行2");
    };
    [self.operationArray addObject:block1];
    [self.operationArray addObject:block2];
    
    [self startQueue];
    
    [self download:@"" withBlcok:^(NSString *some) {
        NSLog(@"down load");
    }];
}

- (void)startQueue {
    for (void(^tmp)(void)  in self.operationArray) {
        tmp();
    }
}

- (void)download:(NSString *)someThing withBlcok:(void(^)(NSString *some))block {
    if(someThing!=nil){
        if([self checkCoin]){
            block(@"");
        }
        if([self checkVip]){
            block(@"");
        }
    }
}

- (BOOL)checkCoin {
    return YES;
}

- (BOOL)checkVip {
    return NO;
}

@end
