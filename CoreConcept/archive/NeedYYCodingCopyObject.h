//
//  NeedSerializeObject.h
//  MojiWeather
//
//  Created by rjb on 2020/5/29.
//  Copyright © 2020 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 需要支持NSCoding或者NSCopying功能数据模型的继承此类即可
 1. 此类自动对全部属性做Coding.
 2. 需要单独自定义属性Coding的自行实现
 */

@interface NeedYYCodingCopyObject:NSObject<NSCoding,NSCopying>

@end

NS_ASSUME_NONNULL_END
