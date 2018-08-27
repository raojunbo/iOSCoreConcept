//
//  RunLoopViewController.m
//  testdown
//
//  Created by rjb on 2018/5/16.
//  Copyright © 2018年 rjb. All rights reserved.
//
/*
 
 每次Runloop循环需要处理很多图
 思路 
 */


#import "RunLoopViewController.h"

@interface RunLoopViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) UIView *aniamtionView;
@property (nonatomic, strong)UIButton *button;
@end

@implementation RunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //timer的目的，是让runloop的状态发生变化
    [self addRunloopObserver];
    [self.view addSubview:self.aniamtionView];
    
    [self.view addSubview:self.button];
    
}

- (UIButton *)button {
    if(!_button){
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"年后" forState:UIControlStateNormal];
        _button.backgroundColor= [UIColor purpleColor];
        _button.frame = CGRectMake(0, 200, 100, 30);
        [_button addTarget:self action:@selector(searchBarClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIView *)aniamtionView {
    if(!_aniamtionView){
        _aniamtionView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 30, 30)];
        _aniamtionView.backgroundColor = [UIColor redColor];
    }
    return _aniamtionView;
}

- (void)searchBarClick {
    //事件会触发
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.fromValue =[NSValue valueWithCGPoint:CGPointMake(0, 0)];
    basicAnimation.toValue =[NSValue valueWithCGPoint:CGPointMake([UIScreen mainScreen].bounds.size.width-30, [UIScreen mainScreen].bounds.size.height-30)];
    basicAnimation.duration = 10;
    basicAnimation.delegate = self;
    [self.aniamtionView.layer addAnimation:basicAnimation forKey:@"hah"];
    
}

- (void)animationDidStart:(CAAnimation *)anim {
    CFRunLoopRef runloop =  CFRunLoopGetCurrent();
    NSLog(@"这是runloop%@",runloop);
}


- (void)addRunloopObserver {
    //通过runloop的事件处理的状态变化,在kCFRunLoopBeforeWaiting,kCFRunLoopAfterWaiting之间变化
    CFRunLoopRef runloop =  CFRunLoopGetCurrent();
    CFRunLoopObserverRef runLoopObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting , YES, 0, &callBack, nil);
    CFRunLoopAddObserver(runloop, runLoopObserver, kCFRunLoopCommonModes);
    CFRelease(runLoopObserver);
}

void callBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"进入");
            break;
        case kCFRunLoopBeforeTimers:
            NSLog(@"即将处理Timer事件");
            break;
        case kCFRunLoopBeforeSources:
            NSLog(@"即将处理Source事件");
            break;
        case kCFRunLoopBeforeWaiting:
            NSLog(@"即将休眠");
            break;
        case kCFRunLoopAfterWaiting:
            NSLog(@"被唤醒");
            break;
        case kCFRunLoopExit:
            NSLog(@"退出RunLoop");
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
