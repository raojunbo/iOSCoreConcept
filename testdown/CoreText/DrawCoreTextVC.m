//
//  DrawCoreTextVC.m
//  testdown
//
//  Created by rjb on 2017/12/18.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "DrawCoreTextVC.h"
#import "CoreTextView.h"

@interface DrawCoreTextVC ()
@property (nonatomic, strong) CoreTextView *textView;
@end

@implementation DrawCoreTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    CoreTextView  *corTextView = [[CoreTextView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:corTextView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
