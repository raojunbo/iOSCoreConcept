//
//  RunLoopViewController5.m
//  testdown
//
//  Created by rjb on 2018/5/22.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RunLoopViewController5.h"

/*
 渲染图片，只能在主线程
 
 每次runloop循环，最多需要加载18张大图
 思路：每次runloo循环，只熏染一张大图
 1;监听runloop的循环
 2:将加载大图的代码，放在一个数组里面
 3：每次Runloop循环，取出一个加载大图
 
typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
    kCFRunLoopEntry = (1UL << 0),
    kCFRunLoopBeforeTimers = (1UL << 1),
    kCFRunLoopBeforeSources = (1UL << 2),
    kCFRunLoopBeforeWaiting = (1UL << 5),
    kCFRunLoopAfterWaiting = (1UL << 6),
    kCFRunLoopExit = (1UL << 7),
    kCFRunLoopAllActivities = 0x0FFFFFFFU
};
*/
@interface RunLoopViewController5 ()

@end

@implementation RunLoopViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
