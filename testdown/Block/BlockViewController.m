//
//  BlockViewController.m
//  testdown
//
//  Created by rjb on 2018/5/26.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BlockViewController.h"
#import "BlockPerson.h"
@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     1.block 作为对象的属性
     */
    void(^bl)(void) = ^(void) {
        
    };
    bl();
    
    BlockPerson *person = [[BlockPerson alloc]init];
    person.raoblock = ^{
        NSLog(@"这是什么");
    };
    person.raoblock();
    
    /*
     2.作为方法的参数
     */
    
    [person eat:^(NSString * ss) {
        NSLog(@"%@",ss);
    }];
    
    
    /*
     3.作为返回值
     用block作为返回值时，可以使用点语法.即相当于是属性
     */
    person.run(100);
    
    
    
    
    
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
