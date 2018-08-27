//
//  BlockKitViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/1.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "BlockKitViewController.h"
#import <BlocksKit.h>


@interface BlockKitViewController ()
@property (nonatomic, strong)NSMutableArray *array;
@end

@implementation BlockKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.array = [[NSMutableArray alloc]init];
    [self.array addObject:@"2"];
    [self.array addObject:@"3"];
    [self.array addObject:@"4"];
    [self.array bk_all:^BOOL(id obj) {
        NSLog(@"%@",obj);
        return YES;
    }];
    
//    NSURL *url = [NSURL URLWithString:@""];
//    UIImage *imag = [UIImage imageNamed:@""];

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
