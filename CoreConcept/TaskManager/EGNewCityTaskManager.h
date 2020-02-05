//
//  EGNewCityTaskManager.h
//  CoreConcept
//
//  Created by rjb on 2020/2/3.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface MJLTaskModel : NSObject
@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL selector;
@end



typedef enum : NSInteger {
    EGWTaskModeSerial = 0,//连续执行
    EGWTaskModeInterval = 1,//间断执行
    EGWTaskModeStop = 2//停止执行
} EGNEWTaskMode;

@interface EGNewCityTaskManager : NSObject

+ (instancetype)shareInstance;

//恢复运行
- (void)resume;

//改变运行模式
- (void)changeToMode:(EGNEWTaskMode)taskMode;

//添加任务
- (void)addTarget:(id)target selector:(SEL)selector;


- (void)runTask:(NSInteger)index ;
@end

NS_ASSUME_NONNULL_END
