//
//  MemoryLeakViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/7/10.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "MemoryLeakViewController.h"

@interface MemoryLeakViewController ()

@end

@implementation MemoryLeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.view.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i<10;i++) {
        @autoreleasepool{
            UIImage *image = [UIImage imageNamed:@"chat"];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
