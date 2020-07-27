//
//  TestArchiveObject.h
//  MojiWeather
//
//  Created by rjb on 2020/7/17.
//  Copyright © 2020 Moji Fengyun Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NeedYYCodingCopyObject.h"
#import "UserArchive.h"
#import "Mantle.h"
NS_ASSUME_NONNULL_BEGIN

@interface TestArchiveObject : NeedYYCodingCopyObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSArray<UserArchive *> *users;
@end

NS_ASSUME_NONNULL_END
