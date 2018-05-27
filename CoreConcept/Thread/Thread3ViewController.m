//
//  Thread3ViewController.m
//  testdown
//
//  Created by rjb on 2018/5/20.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Thread3ViewController.h"

@interface Thread3ViewController ()
@property (assign, atomic)int tickets;
@property (nonatomic,strong) NSObject *lockObj;
@end

@implementation Thread3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *t1 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTickets) object:nil];
    t1.name = @"售票1";
    [t1 start];
    
    NSThread *t2 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTickets) object:nil];
    t2.name = @"售票2";
    [t2 start];
}

- (void)saleTickets {

    while (YES) {
        if(self.tickets > 0){
            //互斥锁尽量减少锁的范围
            @synchronized(self) {
                self.tickets--;
                NSLog(@"剩下章%@",self.tickets);
            }
        }else {
             NSLog(@"完了");
        }
    }
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
