//
//  AppDelegate.m
//  testdown
//
//  Created by rjb on 2017/10/11.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "TestTimeOffsetViewController.h"
#import "DrawVC.h"
#import "TestLayerPropertyVC.h"
#import "Test22ViewController.h"
#import "TestLayerViewController.h"
#import "TestBorderViewController.h"
#import "TestTranformViewController.h"
#import "TestPerspective2ViewController.h"
#import "TestPatLayerViewController.h"
#import "TestSolidViewController.h"
#import "TestShapeLayerVCV.h"
#import "TestContextViewController.h"
#import "TestPainterModelVC.h"
#import "TestContextLineViewController.h"
#import "TestDrawImageViewController.h"
#import "LottiViewVCViewController.h"
#import "TestGerstureVC.h"
#import "TargetModelViewController.h"
#import "BezierPathViewController.h"
#import "DrawCoreTextVC.h"
#import "MethodViewController.h"
#import "TestMasViewController.h"
#import "TestEventViewContrller.h"
#import "RunLoopViewController.h"
#import "RunloopViewController2.h"
#import "RunLoopViewController3.h"
#import "CALayerViewController.h"
#import "AnimationViewController.h"
#import "AnimationActionViewController.h"
#import "RuntimeViewController.h"
#import "Runtime2ViewController.h"
#import "Runtime3ViewController.h"
#import "RunTime4ViewController.h"
#import "Runtime6ViewController.h"
#import "Runtime7ViewController.h"
#import "ThreadViewController.h"
#import "Thread2ViewController.h"
#import "Thread3ViewController.h"
#import "GCDViewController.h"
#import "GCD2ViewController.h"
#import "GCD3ViewController.h"
#import "GCD4ViewController.h"
#import "OperationViewController.h"
#import "AnimationPauseViewController.h"
#import "RunloopViewController4.h"
#import "BlockViewController.h"
#import "TestViewController.h"
#import "FPSViewController.h"
/*
 专题写作之基础知识深入理解
 1.设计模式
 2.事件机制
 3.控制器及转场
 4.动画本质
 5.绘图本质
 6.UIView图层树的思考
 7.VC与view关系
 7.对象模型及运行时
 8.事件循环runloop
 9.RAC实践
 10.自动布局实践(masonry)
 11.加密与解密实践
 12.webView在网络里的实践
 13.block的实现及原理
 
 想清楚操作系统与API里的关系
 */

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
     RunLoopViewController *rootVC = [[RunLoopViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"jj"];
    
//    configuration.sessionSendsLaunchEvents = YES;
    
    
//    UIBackgroundTaskIdentifier *tastk =  [application beginBackgroundTaskWithName:@"rao" expirationHandler:^{
       //handle you actions
        
        
        
        //结束
//        [application endBackgroundTask:tastk];
    
//    }];te
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        application endBackgroundTask:<#(UIBackgroundTaskIdentifier)#>
//    });
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
