//
//  Mediator.m
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Mediator.h"

#import "BookReviewViewController.h"
#import "BookDetailViewController.h"

//mediator依赖于所有的l
@implementation Mediator

+ (UIViewController *)bookDetailComponent_viewController:(NSString *)bookId {
    
    return  [[BookDetailViewController alloc]init];
}

+ (UIViewController *)reviewComponet_viewController:(NSString *)bookId reviewType:(NSInteger)type {
    return [[BookReviewViewController alloc]init];
}

@end
