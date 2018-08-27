//
//  CopyingViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/4.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "CopyingViewController.h"

@interface CopyPerson:NSObject<NSCopying>
@property (nonatomic, strong)NSString *name;
@end

@implementation CopyPerson

- (id)copyWithZone:(NSZone *)zone {
    CopyPerson *person = [[[self class]alloc]init];
    person.name = self.name ;
    return person;
}

@end
@interface CopyingViewController ()

@end

@implementation CopyingViewController

void raotext(){
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"copy";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //对象的复制
    CopyPerson *person = [[CopyPerson alloc]init];
    person.name = @"你好";
    
    CopyPerson *person2 =  [person copy];
    person2.name = @"很好";
    
    NSLog(@"这是第一%@,%@",person,person.name);
    NSLog(@"这是第一%@,%@",person2,person2.name);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
