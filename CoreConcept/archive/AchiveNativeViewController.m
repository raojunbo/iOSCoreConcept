//
//  AchiveNativeViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/7/16.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "AchiveNativeViewController.h"
#import "TestArchiveObject.h"
#import "UserArchive.h"
@interface AchiveNativeViewController ()
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIButton *loadOriginButton;
@property (nonatomic, strong) UIButton *loadDifButton;
@end

@implementation AchiveNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveButton.frame = CGRectMake(0, 100, 200, 50);
    [self.saveButton setTitle:@"存储" forState:UIControlStateNormal];
    self.saveButton.backgroundColor = [UIColor redColor];
    [self.saveButton addTarget:self action:@selector(saveArchive) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveButton];
    
    
    self.loadOriginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loadOriginButton.frame = CGRectMake(0, 150, 200, 50);
    [self.loadOriginButton setTitle:@"读取同类型" forState:UIControlStateNormal];
    self.loadOriginButton.backgroundColor = [UIColor redColor];
    [self.loadOriginButton addTarget:self action:@selector(loadArchive) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loadOriginButton];
    
    self.loadDifButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loadDifButton.frame = CGRectMake(0, 200, 200, 50);
    [self.loadDifButton setTitle:@"读取不同类型" forState:UIControlStateNormal];
    self.loadDifButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.loadDifButton];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveButton.frame = CGRectMake(0, 250, 200, 50);
    [self.saveButton setTitle:@"存储字典" forState:UIControlStateNormal];
    self.saveButton.backgroundColor = [UIColor redColor];
    [self.saveButton addTarget:self action:@selector(saveDictArchive) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveButton];
    
    
    self.loadOriginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loadOriginButton.frame = CGRectMake(0, 300, 200, 50);
    [self.loadOriginButton setTitle:@"读取字典类型" forState:UIControlStateNormal];
    self.loadOriginButton.backgroundColor = [UIColor redColor];
    [self.loadOriginButton addTarget:self action:@selector(loadDictArchive) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loadOriginButton];
}

- (void)saveArchive {
    TestArchiveObject *archiveObject =  [[TestArchiveObject alloc]init];
    archiveObject.name = @"你好";
    archiveObject.age = @"1";

    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i< 3; i++) {
        UserArchive *user = [[UserArchive alloc]init];
        user.name = [NSString stringWithFormat:@"%@",@(i)];
        user.sex = @"1";
        [array addObject:user];
    }
    archiveObject.users = array;
  
    BOOL flag1 = [NSKeyedArchiver archiveRootObject:archiveObject toFile:[self path]];
    if(flag1){
        NSLog(@"归档成功");
    }else{
        NSLog(@"归档失败");
    }
}

- (void)saveDictArchive {
    TestArchiveObject *archiveObject =  [[TestArchiveObject alloc]init];
    archiveObject.name = @"你好";
    archiveObject.age = @"1";
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i< 3; i++) {
        UserArchive *user = [[UserArchive alloc]init];
        user.name = [NSString stringWithFormat:@"%@",@(i)];
        user.sex = @"1";
        [array addObject:user];
    }
    archiveObject.users = array;
    
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:archiveObject forKey:@"archiveObject"];
    BOOL flag1 = [NSKeyedArchiver archiveRootObject:dict toFile:[self dictPath]];
    if(flag1){
        NSLog(@"归档成功");
    }else{
        NSLog(@"归档失败");
    }
}

- (void)loadArchive  {
    TestArchiveObject *unarchiveObject = [NSKeyedUnarchiver unarchiveObjectWithFile:[self path]];
    if(unarchiveObject){
         NSLog(@"读成功");
    }else{
         NSLog(@"读失败");
    }
}

- (void)loadDictArchive {
    NSMutableDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithFile:[self dictPath]];
    TestArchiveObject *archive = [dict objectForKey:@"archiveObject"];
    
}

- (NSString *)path {
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *testArchiverPath =[docPath stringByAppendingPathComponent:@"test.archiver"];//后缀名可以随意命名
    return testArchiverPath;
}

- (NSString *)dictPath {
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *testArchiverPath =[docPath stringByAppendingPathComponent:@"testdict.archiver"];//后缀名可以随意命名
    return testArchiverPath;
}

@end
