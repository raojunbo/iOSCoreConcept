//
//  RunLoopViewController.m
//  testdown
//
//  Created by rjb on 2018/5/16.
//  Copyright © 2018年 rjb. All rights reserved.
//
/*
 哈哈哈，理解了runloop对于性能的有话有很大的作用
 
 每次Runloop循环需要处理很多图
 思路
 每次Runloop每次只渲染1张图
 
 1.监听Runloop循环
 2.将加载大图的代码放在数组里
 3.每次Runloop加载一个代码
 
 */

typedef void(^runBlock)();
#import "RunLoopViewController.h"

@interface RunLoopViewController ()
@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, strong) NSMutableArray * taskArray;
@end

@implementation RunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addTasks:^{
        //加载大图
    }];
    
    //timer的目的，是让runloop的状态发生变化
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeMethod) userInfo:nil repeats:YES];
    [self addRunloopObserver];
    
    
}

- (void)addTasks:(runBlock) runblock{
    [self.taskArray addObject:runblock];
}

- (void)timeMethod {
    //不做任何事情
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)addRunloopObserver {
    //通过runloop的事件处理的状态变化,在kCFRunLoopBeforeWaiting,kCFRunLoopAfterWaiting之间变化
    //获取runloop
    CFRunLoopRef runloop =  CFRunLoopGetCurrent();
    //创建观察者
    CFRunLoopObserverRef runLoopObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting , YES, 0, &callBack, nil);
    //给指定的循环添加观察者
    CFRunLoopAddObserver(runloop, runLoopObserver, kCFRunLoopCommonModes);
    
    //在c里面，一旦create new copy
    CFRelease(runLoopObserver);
}

void callBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    NSLog(@"开了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
