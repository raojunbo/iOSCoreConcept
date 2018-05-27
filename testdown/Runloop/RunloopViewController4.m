//
//  RunloopViewController4.m
//  testdown
//
//  Created by rjb on 2018/5/22.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "RunloopViewController4.h"

/*
 Source:事件源
 Source0:非Source1,比如触摸
 Source1:系统内核事件
 */
@interface RunloopViewController4 ()
@property (nonatomic, strong) dispatch_source_t sourceTimer;
@end

@implementation RunloopViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    //队列
    dispatch_queue_t qu = dispatch_get_global_queue(0, 0);
    
    //创建一个定时器
    self.sourceTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, qu);
    
    //设置定时从现在开始，每秒打印
    dispatch_source_set_timer(self.sourceTimer, DISPATCH_TIME_NOW,  1 * NSEC_PER_SEC, 0);
    
    //设置定时器
    dispatch_source_set_event_handler(self.sourceTimer, ^{
        NSLog(@"r%@",[NSThread currentThread]);
    });
    dispatch_resume(self.sourceTimer);
   
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
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
