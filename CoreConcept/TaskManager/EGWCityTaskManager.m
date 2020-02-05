//
//  EGWCityTaskManager.m
//  MojiWeather
//
//  Created by yang.yang on 2018/6/7.
//  Copyright © 2018年 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import "EGWCityTaskManager.h"
#import <objc/message.h>
#import "EGNewCityTaskManager.h"
//#import "DebugUtils.h"

//@interface MJLTaskModel : NSObject
//
//@property (nonatomic, strong) id target;
//@property (nonatomic, assign) SEL selector;
//
//@end
//
//@implementation MJLTaskModel
//
//@end

@interface EGWCityTaskManager ()

@property (nonatomic, strong) NSMutableArray <MJLTaskModel *> *taskModelArray;
@property (nonatomic, assign, getter = isResuming) BOOL resuming;

@end

static dispatch_semaphore_t semaphore;

@implementation EGWCityTaskManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static EGWCityTaskManager *shareInstance = nil;
    dispatch_once(&onceToken, ^{
        shareInstance = [[EGWCityTaskManager alloc]init];
    });
    return shareInstance;
}

//SYNTHESIZE_ARC_SINGLETON_FOR_CLASS(EGWCityTaskManager)
+ (void)initialize {
    semaphore = dispatch_semaphore_create(1);
}

#pragma mark - task

- (void)cleanTask {
    self.resuming = NO;
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    [self.taskModelArray removeAllObjects];
    dispatch_semaphore_signal(semaphore);
}

- (void)resumeTask {
    if (self.isResuming) {
        return;
    } else {
        self.resuming = YES;
        [self resumeTaskWithIndex:0];
    }
}

- (void)resumeTaskWithIndex:(NSInteger)index {
    if (index < 0 || index >= self.taskModelArray.count) {
        self.resuming = NO;
        return;
    }
    MJLTaskModel *model = self.taskModelArray[index];
    if (![model isKindOfClass:[MJLTaskModel class]]) {
        self.resuming = NO;
        return;
    }
    self.resuming = YES;
    if ([model.target respondsToSelector:model.selector]) {
//        MJXLOG_INFO(@"\n task manager %@, %@", model.target, NSStringFromSelector(model.selector));
        objc_msgSend(model.target, model.selector);
    } else {
        if (model.target && model.selector) {
            //触发断言。
//            MJLASSERT(YES, @"EGW task manager, %@没有对应的%@", model.target, NSStringFromSelector(model.selector));
        }
    }
    //执行结束，删掉。
    //respondsToSelector 返回为 NO 也要删掉。
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    [self.taskModelArray removeObjectAtIndex:index];
    dispatch_semaphore_signal(semaphore);
    
    if (self.taskMode == EGWTaskResumeModeInterval) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self resumeTaskWithIndex:(index)];
        });
    } else if (self.taskMode == EGWTaskResumeModeSerial) {
        [self resumeTaskWithIndex:(index)];
    } else if (self.taskMode == EGWTaskResumeModeStop) {
        //do nothing.
        [self cleanTask];
    }
}

- (void)addTarget:(id)target selector:(SEL)selector {
    MJLTaskModel *model = [[MJLTaskModel alloc] init];
    model.target = target;
    model.selector = selector;
    //线程安全。
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    [self.taskModelArray addObject:model];
    dispatch_semaphore_signal(semaphore);
}

#pragma mark - set

- (void)setTaskMode:(EGWTaskResumeMode)taskMode {
    _taskMode = taskMode;
    if (taskMode == EGWTaskResumeModeStop) {
        [self cleanTask];
    }
}

#pragma mark - get

- (NSMutableArray *)taskModelArray {
    if (!_taskModelArray) {
        _taskModelArray = [[NSMutableArray alloc] init];
    }
    return _taskModelArray;
}

@end
