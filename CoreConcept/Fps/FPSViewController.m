//
//  FPSViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/9/13.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "FPSViewController.h"

@interface FPSViewController ()
@property (nonatomic, strong)CADisplayLink *link;
@end

@implementation FPSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick)];
    //刷新屏幕时固定的吗
    //
}

- (void)tick {
    
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
