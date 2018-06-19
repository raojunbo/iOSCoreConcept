//
//  RootBlockViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/5/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RootBlockViewController.h"
#import "AFNetworking.h"
#import <Masonry.h>
#import "BlockCircleViewController.h"
@interface RootBlockViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;
@end

@implementation RootBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = @[
                       @"BlockViewController",
                       @"BlockCircleViewController",
                       ];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}
- (UITableView *)tableView {
    if(!_tableView){
        _tableView = [[UITableView alloc]init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ff"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ff"];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class class = NSClassFromString([self.dataArray objectAtIndex:indexPath.row]);
    NSObject *objc =  [[class alloc]init];
    [self.navigationController pushViewController:objc animated:YES];
    
    //以下代码测试block里的对象销毁后的效果
//    BlockCircleViewController *clockCircel  = [[BlockCircleViewController alloc]init];
//    clockCircel.backBlock = ^(void (^block)(void)) {
//        NSLog(@"回来了吗");
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//              block();
//        });
//    };
    
//    2018-05-29 09:39:18.894 CoreConcept[27900:754610] 回来了吗
//    2018-05-29 09:39:19.408 CoreConcept[27900:754610] 销毁了吗
//    2018-05-29 09:39:22.190 CoreConcept[27900:754610] 这是raoBlockA:0
//    2018-05-29 09:39:22.190 CoreConcept[27900:754610] 这是raoBlockA:(null)

//    [self.navigationController pushViewController:clockCircel animated:YES];
    
}

@end
