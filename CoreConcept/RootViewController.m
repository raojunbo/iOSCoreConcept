//
//  RootViewController.m
//  testdown
//
//  Created by rjb on 2017/10/11.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "RootViewController.h"
#import "AFNetworking.h"
#import <Masonry.h>
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"这是目录%@",NSHomeDirectory());

    self.dataArray = @[
                       @"RootBlockViewController",
                       @"ThreadViewController",
                       @"RuntimeViewController",
                       @"RunLoopViewController",
                       @"GCDBarrierViewController",
                       @"ReadSDWebViewController",
                       @"OperationCustomViewController",
                       @"ImageViewController",
                       @"BlockKitViewController",
                       @"MemoryLeakViewController",
                       @"BlockTestViewController"
                       ];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
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
}

@end
