//
//  ThreadLockViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "ThreadLockViewController.h"
#import <libkern/OSAtomic.h>

@interface ThreadLockViewController ()
@property (nonatomic, assign)dispatch_semaphore_t semaphore;
@property (nonatomic, assign)OSSpinLock spinlock;
@end

@implementation ThreadLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个信号量为1的信号
    self.semaphore = dispatch_semaphore_create(1);
    self.spinlock = OS_SPINLOCK_INIT;
}

- (void)getImageName:(NSMutableArray *)imageNames {
    NSString *imageName;
    NSLock *lock = [[NSLock alloc]init];
    [lock lock];
    if(imageNames.count>0){
        imageName = [imageNames lastObject];
        [imageNames removeObject:imageName];
    }
    [lock unlock];
}

- (void)getImageName2:(NSMutableArray *)imageNames {
    NSString *imageName;
    @synchronized(self){
        if(imageNames.count>0){
            imageName = [imageNames lastObject];
            [imageNames removeObject:imageName];
        }
    }
}

- (void)getImageName3:(NSMutableArray *)imageNames {
    NSString *imageName;
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);//-1;
    if(imageNames.count>0){
        imageName = [imageNames lastObject];
        [imageNames removeObject:imageName];
    }
    dispatch_semaphore_signal(self.semaphore);//+1
}

- (void)getImageNmae:(NSMutableArray *)imageNames {
    NSString *imageName;
    //性能最高的锁
    //但会消耗大量的cpu资源
    OSSpinLockLock(&_spinlock);
    if(imageNames.count>0){
        imageName = [imageNames lastObject];
        [imageNames removeObject:imageName];
    }
    OSSpinLockUnlock(&_spinlock);
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
