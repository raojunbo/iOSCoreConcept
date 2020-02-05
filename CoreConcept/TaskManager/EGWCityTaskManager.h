//
//  EGWCityTaskManager.h
//  MojiWeather
//
//  Created by yang.yang on 2018/6/7.
//  Copyright © 2018年 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

//#define EGW_TASK_MGR [EGWCityTaskManager sharedInstance]
#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    EGWTaskResumeModeSerial = 0,
    EGWTaskResumeModeInterval = 1,
    EGWTaskResumeModeStop = 2,
}EGWTaskResumeMode;

#import <Foundation/Foundation.h>

@interface EGWCityTaskManager : NSObject

//SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(EGWCityTaskManager)

@property (nonatomic, assign) EGWTaskResumeMode taskMode;

+ (instancetype)shareInstance;
- (void)resumeTask;
- (void)cleanTask;
- (void)addTarget:(id)target selector:(SEL)selector;

@end
