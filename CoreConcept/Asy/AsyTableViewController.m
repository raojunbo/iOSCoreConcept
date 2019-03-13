//
//  AsyTableViewController.m
//  CoreConcept
//
//  Created by rjb on 2019/3/11.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "AsyTableViewController.h"
#import <Masonry.h>
#import "UIImageView+AsyLoad.h"
#import "OutDrawObject.h"

@interface AsyTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *testImageView;
@property (nonatomic, strong) OutDrawObject *drawObject;
@end

@implementation AsyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self createUI];
    }
    return self;
}

- (void)createUI {
    [self.contentView addSubview:self.testImageView];
    [self.testImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (void)setDrawObject:(OutDrawObject *)drawObject {
    _drawObject = drawObject;
    if(drawObject){
        UIImage *image = [drawObject disasterMultipleWarningImgbyDwIcon:@"text2"];
        self.testImageView.image = image;
        
    }
}

- (UIImageView *)testImageView {
    if(!_testImageView){
        _testImageView = [[UIImageView alloc]init];
    }
    return _testImageView;
}

+ (CGFloat)height {
    return 150;
}

@end

@interface AsyTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;
@end

@implementation AsyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //图片数组
    self.dataArray = @[
                       @"chat",
                       @"chat",
                       @"chat",
                       @"chat",
                       @"chat"
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
        [_tableView registerClass:[AsyTableViewCell class] forCellReuseIdentifier:NSStringFromClass([AsyTableViewCell class])];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AsyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AsyTableViewCell class])];
    NSString *testImageStr = [self.dataArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = testImageStr;
   
    if(indexPath.row%2==0){
        cell.backgroundColor = [UIColor greenColor];
    }else{
        cell.backgroundColor = [UIColor redColor];
    }
    if (indexPath.row == 2) {
        OutDrawObject *outDrawObjct = [[OutDrawObject alloc]init];
        cell.drawObject = outDrawObjct;
    }else{
         [cell.testImageView asyload_imageName:testImageStr];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AsyTableViewCell height];
}

@end
