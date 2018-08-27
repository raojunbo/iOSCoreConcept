//
//  MVPViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/24.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "MVPViewController.h"
#import "UserPresenter.h"

/*
 mvvm,mvp都是从mvc里演变过来的
 
 */
@interface MVPViewController ()<UITableViewDataSource,UserViewDelegate>
@property (nonatomic, strong)UIView *emptyView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIActivityIndicatorView *indicator;

@property (nonatomic, strong)NSArray <UserViewData *>  *userViewDatas;
@property (nonatomic, strong)UserPresenter *userPresenter;
@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userPresenter = [[UserPresenter alloc]init];
    self.tableView.dataSource= self;
    self.userPresenter.delegate = self;
    
}

#pragma  mark --UserViewDelegate

- (void)startloading{
    self.indicator.hidden = NO;
    [self.indicator startAnimating];
}
- (void)finishloading {
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
}

- (void)setUsers:(NSArray<UserViewData *> *)usersData {
    self.userViewDatas = usersData;
    self.tableView.hidden = NO;
    self.emptyView.hidden = YES;
    [self.tableView reloadData];
}

- (void)setEmptyUsers {
    self.tableView.hidden = YES;
    self.emptyView.hidden = NO;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdStr = @"cellStr";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdStr];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdStr];
    }
    UserViewData *userModel = [self.userViewDatas objectAtIndex:indexPath.row];
    cell.textLabel.text = userModel.name;
    cell.detailTextLabel.text = userModel.age;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
