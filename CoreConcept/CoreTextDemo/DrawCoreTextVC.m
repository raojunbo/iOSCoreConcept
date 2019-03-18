//
//  DrawCoreTextVC.m
//  testdown
//
//  Created by rjb on 2017/12/18.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "DrawCoreTextVC.h"
#import "CoreTextView.h"
#import "CoreTextView2.h"
@interface DrawCoreTextVC ()
//@property (nonatomic, strong) CoreTextView *textView;
@property (nonatomic, strong) CoreTextView2 *textView2;
@end

@implementation DrawCoreTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CoreTextView2  *corTextView = [[CoreTextView2 alloc]initWithFrame:CGRectMake(40, 100, 200, 200)];
    corTextView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:corTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
