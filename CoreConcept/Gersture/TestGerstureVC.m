//
//  TestGerstureVC.m
//  testdown
//
//  Created by rjb on 2017/12/11.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestGerstureVC.h"
#import "CustomGestureRecognizer.h"
#import "TouchView1.h"
#import "TouchView2.h"
@interface TestGerstureVC ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation TestGerstureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
//    UIApplication
//    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200 )];
//    self.imageView.backgroundColor = [UIColor redColor];
//    self.imageView.userInteractionEnabled = YES;
//    [self.view addSubview:self.imageView];
//
//    CustomGestureRecognizer *cutomGer = [[CustomGestureRecognizer alloc]initWithTarget:self action:@selector(customClick)];
//    [self.imageView addGestureRecognizer:cutomGer];
////    cutomGer.vi
   
    
//    NSLog(@"这是gecognizers:%@",self.imageView.gestureRecognizers);
//    UITapGestureRecognizer *tapGer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
//    [self.imageView addGestureRecognizer:tapGer];
//    UIRotationGestureRecognizer *rotationGer = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationClick:)];
//    [self.imageView addGestureRecognizer:rotationGer];
//    UIResponder
//    NSBundle
    TouchView2 *touchview2 = [[TouchView2 alloc]initWithFrame:CGRectMake(0, 0, 400, 400)];
    touchview2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:touchview2];
    UITapGestureRecognizer *tapGer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [touchview2 addGestureRecognizer:tapGer];
    
}
- (void)customClick{
    
}
//- (void)rotationClick:(UIRotationGestureRecognizer *)rotationGer{
//    NSLog(@"rotationGer:%@",@(rotationGer.rotation));
//}

- (void)tapClick{
    NSLog(@"手势点击");
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"begin%@",touches);
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"move%@",touches);
//
//}
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"end%@",touches);
//}


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


//
