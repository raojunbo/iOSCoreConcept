//
//  User.h
//  CoreConcept
//
//  Created by rjb on 2020/7/17.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NeedYYCodingCopyObject.h"
#import "MTLModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserArchive : NeedYYCodingCopyObject
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * sex;
@end

NS_ASSUME_NONNULL_END
