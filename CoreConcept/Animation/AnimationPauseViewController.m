//
//  AnimationPauseViewController.m
//  testdown
//
//  Created by rjb on 2018/5/22.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "AnimationPauseViewController.h"
#import <Masonry.h>
@interface AnimationPauseViewController ()
@property (nonatomic, strong)UIImageView     *imageView1;
@property (nonatomic, strong)UISlider        *slider;
@end

@implementation AnimationPauseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     一：
     beginTime是相对于父对象的时间，当最后的父对象被设置为CACurrentMediaTime()值
     t = (tp - begin) *speed + offset;
     t:本对象时间线
     tp:父对象时间线
     begin:开始时间即beginTime
     speed:时间流速
     offset:一个初始偏移
     begin,speed,offset是参数，tp才是变量，它会随着时间的流速，而递增。
     t = CACurrentMediaTime() - begin +offset(tp=CACurrentMediaTime(),speed=1)
     t代表本地时空，即本对象时空
     二：
     1.硬件开机时间
     CACurrentMediaTime()
     图层的时间线都是以它为基准，CACurrentMediaTime()将mach_absolute_time()返回的结果化为秒得到。mach_absolute_time()
     返回cpu里内建时钟的周期数。这个tick数，在每次手机重启后，会重新计数，而且iphone锁屏进入休眠后tick也会暂停
     
     2.图层时空转换
//    self.view.layer convertTime:<#(CFTimeInterval)#> toLayer:<#(nullable CALayer *)#>
//    self.view.layer convertTime:<#(CFTimeInterval)#> fromLayer:<#(nullable CALayer *)#>
     
     三：CALayer和CAAnimaiton都有自己的时间线
     
     */
    
    
    //这是一个修改1
    //这是一个修改2
    
    
   
}

- (void)test2 {
    CALayer *layer1 = [CALayer layer];
    CALayer *layer2 = [CALayer layer];
    [layer1 addSublayer:layer2];
    [self.view.layer addSublayer:layer1];
    
    layer2.beginTime = 3;
    layer2.speed = 2;
    layer2.timeOffset = 5;
    //获取图层在此刻的本地时间
    
    CFTimeInterval absoluteTime  = CACurrentMediaTime();
    CFTimeInterval t = [layer1 convertTime:absoluteTime fromLayer:nil];
    CFTimeInterval tp = [layer2 convertTime:absoluteTime toLayer:nil];
    CFTimeInterval t0 = (tp - layer2)
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
