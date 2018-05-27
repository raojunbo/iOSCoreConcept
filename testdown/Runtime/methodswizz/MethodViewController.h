//
//  MethodViewController.h
//  testdown
//
//  Created by rjb on 2018/1/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <objc/objc.h>
//#import <objc/runtime.h>

//@interface MTeacher:NSObject
//+ (void)work;
//@end

//@implementation MTeacher

//+ (void)work{
//    NSLog(@"I am Teacher");
//}

//@end

//@interface MTeacher(RuntimeChange)
//+(void)Runtimeowork;
//@end

//@implementation MTeacher(RuntimeChange)
//+(void)Runtimeowork{
//    NSLog(@"I am student");
//}

//+(void)load{
//    NSString *className = NSStringFromClass(self.class);
//    NSLog(@"className%@",className);
//    SEL originSelector = @selector(work);//得到方法签名
//    SEL swizzleSelector = @selector(Runtimeowork);//得到方法签名
//    Method oriMethod = class_getInstanceMethod(self.class, originSelector);
//    Method swizzMethod = class_getInstanceMethod(self.class, swizzleSelector);
//    BOOL sucessFlag = class_addMethod([MTeacher class], originSelector, method_getImplementation(swizzMethod),method_getTypeEncoding(swizzMethod));
//    if(sucessFlag){
//        //将swizzle的实现为以前的实现
//        class_replaceMethod(self.class, swizzleSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
//    }else{
//        method_exchangeImplementations(oriMethod, swizzMethod);
//    }
//}

//@end

@interface MethodViewController : UIViewController

@end
