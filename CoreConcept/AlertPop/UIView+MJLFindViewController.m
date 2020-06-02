//
//  UIView+MJLFindViewController.m
//  Pods
//
//  Created by Hunry on 2016/11/30.
//
//

#import "UIView+MJLFindViewController.h"

@implementation UIView (MJLFindViewController)

- (UIViewController *)mjl_parentViewController
{
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass:[UIViewController class]])
            return (UIViewController *)responder;
    return nil;
}

- (UINavigationController *)mjl_parentNavigationViewController
{
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass:[UINavigationController class]])
            return (UINavigationController *)responder;
    return nil;
}

@end
