//
//  TestLayerPropertyVC.m
//  testdown
//
//  Created by rjb on 2017/11/28.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestLayerPropertyVC.h"

@interface TestLayerPropertyVC ()
@property (nonatomic, strong) UIView *oneView;
@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, strong) UIView *thirdView;
@property (nonatomic, strong) UIView *forthView;
@end

@implementation TestLayerPropertyVC

- (void)addSpriteImage:(UIImage *)image contentRect:(CGRect) rect toLayer:(CALayer *)layer{
    //实际上整个图片都是会给他，但只是取里的一个值
    layer.contentsRect = rect;
    layer.contents = (__bridge id _Nullable)(image.CGImage);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.oneView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:self.oneView];
    self.oneView.backgroundColor = [UIColor redColor];
    
    self.secondView = [[UIView alloc]initWithFrame:CGRectMake(200, 0, 200, 200)];
    [self.view addSubview:self.secondView];
    
    self.thirdView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 200, 200)];
    [self.view addSubview:self.thirdView];
    
    self.forthView = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 0, 200)];
    [self.view addSubview:self.forthView];
    
    UIImage *image = [UIImage imageNamed:@"textbig"];
    [self addSpriteImage:image contentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.oneView.layer];
    [self addSpriteImage:image contentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.secondView.layer];
    [self addSpriteImage:image contentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.thirdView.layer];
    [self addSpriteImage:image contentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.forthView.layer];
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
