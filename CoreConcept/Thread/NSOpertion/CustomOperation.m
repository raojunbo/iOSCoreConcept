//
//  CustomOperation.m
//  CoreConcept
//
//  Created by rjb on 2018/7/1.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "CustomOperation.h"

/*
 NSOperation类时给一个在main函数里执行的任务的。它会在main执行完后。设置finished的值。
 如果想自定义，那么必须自己是控制finished,executing的状态。
 NSOperation本来给finished，executing对外不能修改。但自定义的operation要修改，就得重写，
 并且要保持对外kvo的监听
 
 */

@interface CustomOperation()

@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished) BOOL finished;

@end
@implementation CustomOperation
@synthesize executing = _executing;
@synthesize finished = _finished;

/*
 Operation在需要自定义时,可以重写start方法，和main方法
 当我需要自己给外部
 */
-(void)start {
    //很耗时的操作
    self.executing = YES;

    int i = 100000;
    while (i > 0) {
        i--;
    }
    NSThread *thread= [NSThread currentThread];
    NSLog(@"%@",thread);
    self.executing = NO;
    self.finished = YES;
}

- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}
@end
