//
//  BookDetailViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BookDetailViewController.h"
#import "Mediator3.h"
#import "ProtocolMediator3.h"
@interface BookDetailViewController ()
@property (nonatomic, strong)NSString *bookId;
@end

@implementation BookDetailViewController

+ (void)load {
    //在第一次发送消息时，进行注册模块。每个模块都得先注册。
    //可以将Mediator3放到主工程去。所有的都去依赖主工程。
    [[Mediator3 shareInstance] registerURLPattern:@"weread://bookDetail" toHandler:^(id param) {
        NSDictionary *paramDict = (NSDictionary *)param;
        BookDetailViewController *bookDetailVC = [[BookDetailViewController alloc]initWithBookId:paramDict[@"bookId"]];
        UINavigationController *nav = (UINavigationController *) [UIApplication sharedApplication].keyWindow.rootViewController;
        [nav pushViewController:bookDetailVC animated:YES];
    }];
    
    
    
    
    //采用注册协议的方式
    [[ProtocolMediator3 shareInstance] registerProtocol:@protocol(BookDetailComponentProtocol) forClass:[self class]];
}


- (UIViewController *)bookDetailViewController:(NSString *)bookId {
    return [[BookDetailViewController alloc]init];
}

- (instancetype)initWithBookId:(NSString *)bookId {
    if(self = [super init]){
        _bookId = bookId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"这是bookDetail";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
