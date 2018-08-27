//
//  ReadSDWebViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/29.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "ReadSDWebViewController.h"
#import "UIImageView+WebCache.h"

@interface ReadSDWebViewController ()
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation ReadSDWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSURL *url = [NSURL URLWithString:@"https://ss1.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=f560166a52df8db1a32e7a643922dddb/0ff41bd5ad6eddc4f8daa30935dbb6fd52663306.jpg"];
    [self.imageView sd_setImageWithURL:url];
    [self.view addSubview:self.imageView];
}

- (UIImageView *)imageView {
    if(!_imageView){
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
