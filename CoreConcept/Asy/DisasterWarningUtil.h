//
//  DisasterWarningArray.h
//  MojiWeather
//
//  Created by Andy Gu on 5/27/14.
//  Copyright (c) 2014 Moji Fengyun Software & Technology Development co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DisasterWarnUtilInstance [DisasterWarningUtil sharedInstance]

@class DisasterWarning;

@interface DisasterWarningUtil : NSObject

@property (nonatomic, strong) NSMutableArray *pushDisasterWaringArray;
@property (nonatomic, strong) NSDictionary *levelDictionary;

//单例
+ (DisasterWarningUtil *)sharedInstance;
//把预警进行排序,先按时间排，同一时间，级别高的在前面
- (NSArray *)sortDisasterArray:(NSArray *)array;

@end
