//
//  ReadingViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "ReadingViewController.h"
#import "Mediator.h"
#import "Mediator2.h"
#import "Mediator3.h"
#import "ComponentProtocol.h"
#import "ProtocolMediator3.h"
@interface ReadingViewController ()

@end

@implementation ReadingViewController

+ (void)load {
    [[ProtocolMediator3 shareInstance]registerProtocol:@protocol(BookDetailComponentProtocol) forClass:[self class]];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"readingVC";
    //mediator依赖所有的类
//    UIViewController *detailVC = [Mediator bookDetailComponent_viewController:@""];
//    [self.navigationController pushViewController:detailVC animated:YES];
    
//    UIViewController *reviewVC = [Mediator reviewComponet_viewController:@"" reviewType:1];
//    [self.navigationController pushViewController:reviewVC animated:YES];
    
    //runtime解依赖
//    UIViewController *detailVC2 = [Mediator2 bookDetailComponent_viewController:@""];
//    [self.navigationController pushViewController:detailVC2 animated:YES];
    
//    UIViewController *reviewVC2 = [Mediator2 reviewComponet_viewController:@"" reviewType:2];
//    [self.navigationController pushViewController:reviewVC animated:YES];
    
    
    //注册url与block的映射
//    [[Mediator3 shareInstance] openURL:@"weread://bookDetail" withParam:@{@"bookId":@"2"}];
    
    
    //注册protocol与Class的映射
    //这里采用protocol的原因是，用协议取申明对外公开的方法
    Class cls = [[ProtocolMediator3 shareInstance] classForProtocol:@protocol(BookDetailComponentProtocol)];
    id bookDetailVC = [[cls alloc]init];
    [self.navigationController pushViewController:bookDetailVC animated:YES];
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
