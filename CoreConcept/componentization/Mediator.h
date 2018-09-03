//
//  Mediator.h
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Mediator : NSObject

+ (UIViewController *)bookDetailComponent_viewController:(NSString *)bookId;

+ (UIViewController *)reviewComponet_viewController:(NSString *)bookId reviewType:(NSInteger)type;

@end
