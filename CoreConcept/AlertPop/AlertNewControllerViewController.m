//
//  AlertNewControllerViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/6/1.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "AlertNewControllerViewController.h"
//#import "UIWebView+MJLExtension.h"

@interface AlertNewControllerViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation AlertNewControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.webView];
//    [self.webView mj_webView:self runJavaScriptConfirmPanelWithMessage:@"1" initiatedByFrame:nil];
//    [self.webView mj_webView:self runJavaScriptConfirmPanelWithMessage:@"2" initiatedByFrame:nil];

}

- (void)POP {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"选择WebView1" message:@"便于测试，选择某种类型的web之后，会在之后的测试中，使用到，针对 MJWebViewController 继承关系" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* actionDo = [UIAlertAction actionWithTitle:@"恢复" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction* actionDoWeb = [UIAlertAction actionWithTitle:@"UIWebView" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction* actionDoWK = [UIAlertAction actionWithTitle:@"WKWebView" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:actionDo];
    [alertVC addAction:actionDoWeb];
    [alertVC addAction:actionDoWK];
    [self presentViewController:alertVC animated:YES completion:nil];
//    
//    [self dismissViewControllerAnimated:YES completion:^{
//        UIAlertController *alertVC2 = [UIAlertController alertControllerWithTitle:@"选择WebView2" message:@"便于测试，选择某种类型的web之后，会在之后的测试中，使用到，针对 MJWebViewController 继承关系" preferredStyle:UIAlertControllerStyleAlert];
//          UIAlertAction* actionDo2 = [UIAlertAction actionWithTitle:@"恢复" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//              
//          }];
//          UIAlertAction* actionDoWeb2 = [UIAlertAction actionWithTitle:@"UIWebView" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//              
//          }];
//          UIAlertAction* actionDoWK2 = [UIAlertAction actionWithTitle:@"WKWebView" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//              
//          }];
//          [alertVC2 addAction:actionDo2];
//          [alertVC2 addAction:actionDoWeb2];
//          [alertVC2 addAction:actionDoWK2];
//          [self presentViewController:alertVC2 animated:YES completion:nil];
//    }];
    
    
  
}



@end
