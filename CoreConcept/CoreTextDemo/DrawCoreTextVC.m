//
//  DrawCoreTextVC.m
//  testdown
//
//  Created by rjb on 2017/12/18.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "DrawCoreTextVC.h"
#import "CoreRichTextView.h"
#import "CoreRichTextView.h"
@interface DrawCoreTextVC ()

@property (nonatomic, strong) CoreRichTextView *textView2;
@end

@implementation DrawCoreTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //测试数据
    //链接
    //图片
    //文本
    NSArray *array = @[[self createLinkItem],[self createImageItem],[self createTextItem],[self createFillItem]];
    CoreRichTextData *richTextData = [[CoreRichTextData alloc]initWithSentenceArray:array];
   
    
    
    CoreRichTextView  *corTextView = [[CoreRichTextView alloc]initWithFrame:CGRectMake(40, 70, 200, 200)];
    corTextView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:corTextView];
    corTextView.richTextData = richTextData;
    corTextView.numberOfLines = 5;
  
    CoreRichTextView  *corTextView2 = [[CoreRichTextView alloc]initWithFrame:CGRectMake(40, corTextView.frame.origin.y+200+10, 200, 200)];
    corTextView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:corTextView2];
    corTextView2.richTextData = richTextData;
//    corTextView2.numberOfLines = 2;
//    [corTextView2 sizeToFit];
}

- (CoreLinkItem *)createLinkItem {
    UIFont *linkFont = [UIFont systemFontOfSize:15];
    NSDictionary *linkAttributes = @{NSFontAttributeName:linkFont,NSForegroundColorAttributeName:[UIColor redColor]};
    
    CoreLinkItem *linkItem = [[CoreLinkItem alloc]init];
    linkItem.linkAttributesText = [[NSAttributedString alloc]initWithString:@"www.baidubaidubaidubaidu.com." attributes:linkAttributes];
    return linkItem;
}

- (CoreImageItem *)createImageItem {
    CoreImageItem *imageItem = [[CoreImageItem alloc]init];
    imageItem.image = [UIImage imageNamed:@"text2"];
    return imageItem;
}

- (CoreTextItem *)createTextItem {
    UIFont *normalFont = [UIFont systemFontOfSize:15];
    NSDictionary *normalAttributes = @{NSFontAttributeName:normalFont,NSForegroundColorAttributeName:[UIColor blackColor]};
    
    CoreTextItem *textItem  = [[CoreTextItem alloc]init];
    textItem.normalAttributesText = [[NSAttributedString alloc]initWithString:@"墨迹9周年,我要去哪里？" attributes:normalAttributes];
    return textItem;
}

- (CoreFillInItem *)createFillItem {
    CoreFillInItem *fillItem = [[CoreFillInItem alloc]init];
    UITextField *textFieldView =  [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    textFieldView.backgroundColor = [UIColor redColor];
    fillItem.textFiledView = textFieldView;
    return fillItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
