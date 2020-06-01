//
//  TestCityTaskManagerViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/2/5.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "TestCityTaskManagerViewController.h"
#import "EGNewCityTaskManager.h"
#import "EGWCityTaskManager.h"
@interface TestCityTaskManagerViewController ()
@property (nonatomic, strong)UIButton *button1;
@property (nonatomic, strong)UIButton *button2;
@property (nonatomic, strong)UIButton *button3;
@property (nonatomic, strong)UIButton *button4;
@property (nonatomic, strong) NSDate *statDate;
@end

@implementation TestCityTaskManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button1.frame = CGRectMake(0, 100, 100, 50);
    self.button1.backgroundColor = [UIColor redColor];
    [self.button1 setTitle:@"newserial" forState:UIControlStateNormal];
    [self.view addSubview:self.button1];
    [self.button1 addTarget:self action:@selector(testSerial) forControlEvents:UIControlEventTouchUpInside];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button2.frame = CGRectMake(0, 200, 100, 50);
    self.button2.backgroundColor = [UIColor greenColor];
    [self.button2 setTitle:@"newInterval" forState:UIControlStateNormal];
    [self.view addSubview:self.button2];
    [self.button2 addTarget:self action:@selector(testIntever) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button3.frame = CGRectMake(200, 100, 100, 50);
    self.button3.backgroundColor = [UIColor purpleColor];
    [self.button3 setTitle:@"originSerial" forState:UIControlStateNormal];
    [self.view addSubview:self.button3];
    [self.button3 addTarget:self action:@selector(testOriginSerial) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button3.frame = CGRectMake(200, 200, 100, 50);
    self.button3.backgroundColor = [UIColor purpleColor];
    [self.button3 setTitle:@"originInterval" forState:UIControlStateNormal];
    [self.view addSubview:self.button3];
    [self.button3 addTarget:self action:@selector(testOriginIntever) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)testSerial {
    //6个去执行
    NSDate *statDate = [NSDate date];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]resume];
    [[EGNewCityTaskManager shareInstance]changeToMode:EGWTaskModeStop];
    NSDate *endDate = [NSDate date];
    NSTimeInterval interval = [endDate timeIntervalSinceDate:statDate] *1000;

    NSLog(@"serial:总耗时%f",interval);
}

- (void)testIntever {
    //6个去执行
    count = 0;
     [self test_asy];
    self.statDate = [NSDate date];
    [[EGNewCityTaskManager shareInstance]changeToMode:EGWTaskModeInterval];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGNewCityTaskManager shareInstance]resume];
}


- (void)testOriginSerial {
    //6个去执行
    NSDate *statDate = [NSDate date];
    [[EGWCityTaskManager shareInstance]setTaskMode:EGWTaskResumeModeSerial];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]resumeTask];
    [[EGWCityTaskManager shareInstance]setTaskMode:EGWTaskResumeModeStop];
    NSDate *endDate = [NSDate date];
    NSTimeInterval interval = [endDate timeIntervalSinceDate:statDate] *1000;
    
    NSLog(@"OriginSerial :总耗时%f",interval);
}

static NSInteger count = 0;

- (void)testOriginIntever  {
    //6个去执行
//    NSDate *statDate = [NSDate date];
    count = 0;
   
    self.statDate = [NSDate date];
    [[EGWCityTaskManager shareInstance]setTaskMode:EGWTaskResumeModeInterval];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]addTarget:self selector:@selector(testSEl)];
    [[EGWCityTaskManager shareInstance]resumeTask];
//    [[EGWCityTaskManager shareInstance]setTaskMode:EGWTaskResumeModeStop];
    NSDate *endDate = [NSDate date];
    NSTimeInterval interval = [endDate timeIntervalSinceDate:self.statDate] *1000;
    
//    NSLog(@"OriginIntever  :总耗时%f",interval);
}

- (void)testSEl {
    //多了近500ms的耗时
    sleep(1);
    NSLog(@"这是testSEL");
    if(count == 5){
        NSDate *endDate = [NSDate date];
        NSTimeInterval interval = [endDate timeIntervalSinceDate:self.statDate] *1000;
        
        NSLog(@"OriginIntever  :总耗时%f",interval);
    }
    count++;
}

- (void)test_asy {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"哈哈，我回来了");
    });
}

@end
