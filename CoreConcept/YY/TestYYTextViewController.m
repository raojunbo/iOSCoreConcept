//
//  TestYYTextViewController.m
//  CoreConcept
//
//  Created by rjb on 2019/3/24.
//  Copyright © 2019 rjb. All rights reserved.
//

#import "TestYYTextViewController.h"
#import <YYText.h>
@interface TestYYTextViewController ()

@end

@implementation TestYYTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:16];
    NSMutableAttributedString *attachment = nil;
    
    // 嵌入 UIImage
    UIImage *image = [UIImage imageNamed:@"chat"];
    attachment = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [text appendAttributedString: attachment];
    
    UITextField *filed = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    filed.backgroundColor = [UIColor redColor];
    attachment = [NSMutableAttributedString yy_attachmentStringWithContent:filed contentMode:UIViewContentModeCenter attachmentSize:filed.frame.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [text appendAttributedString: attachment];
    
    // 嵌入 UIView
    UISwitch *switcher = [UISwitch new];
    switcher.backgroundColor = [UIColor greenColor];
    [switcher sizeToFit];
    attachment = [NSMutableAttributedString yy_attachmentStringWithContent:switcher contentMode:UIViewContentModeBottom attachmentSize:switcher.frame.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [text appendAttributedString: attachment];
    
    
    YYTextView *testView = [[YYTextView alloc]initWithFrame:CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 300)];
    testView.attributedText = text;
    [self.view addSubview:testView];
    testView.backgroundColor = [UIColor grayColor];
    
}


@end
