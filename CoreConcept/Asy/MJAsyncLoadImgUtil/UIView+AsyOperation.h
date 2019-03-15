//
//  UIView+AsyOperation.h
//  CoreConcept
//
//  Created by rjb on 2019/3/12.
//  Copyright © 2019 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJLAsyncLoadImgUtil.h"
NS_ASSUME_NONNULL_BEGIN

/*
 将每一个UIView对象与operation一一绑定，将同一对象的operation在做了新的operation要将旧的cancel掉
 */
@interface UIView (AsyOperation)

- (void)mj_setImageLoadOperation:(AsyDrawOperation *)operation forKey:(nullable NSString *)key;

- (void)mj_cancelImageLoadOperationWithKey:(nullable NSString *)key;

- (void)mj_removeImageLoadOperationWithKey:(nullable NSString *)key;

@end

NS_ASSUME_NONNULL_END
