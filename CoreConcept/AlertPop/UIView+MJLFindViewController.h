//
//  UIView+MJLFindViewController.h
//  Pods
//
//  Created by Hunry on 2016/11/30.
//
//

#import <UIKit/UIKit.h>

@interface UIView (MJLFindViewController)

/**
 查找视图所在的控制器

 @return 返回控制器
 */
- (UIViewController *)mjl_parentViewController;

/**
 查找视图所在的导航控制器

 @return 返回导航控制器
 */
- (UINavigationController *)mjl_parentNavigationViewController;

@end
