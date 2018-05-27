//
//  TestSolidViewController.m
//  testdown
//
//  Created by rjb on 2017/11/30.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestSolidViewController.h"

@interface TestSolidViewController ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) NSMutableArray *mArray;
@end

@implementation TestSolidViewController

- (void)addFace:(NSInteger) face withTransform:(CATransform3D)transform3D{
    UIButton *faceView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    if (face==0) {
        faceView.backgroundColor= [UIColor greenColor];
    }else if(face==1){
        faceView.backgroundColor = [UIColor redColor];
    }else if(face==2){
        faceView.backgroundColor = [UIColor purpleColor];
    }else if(face==3){
        faceView.backgroundColor = [UIColor orangeColor];
    }
    faceView.tag = face;
    [faceView setTitle:[NSString stringWithFormat:@"%@",@(face)] forState:UIControlStateNormal];
    [faceView addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    faceView.text = [NSString stringWithFormat:@"面%@",@(face)];
//    faceView.textAlignment = NSTextAlignmentCenter;
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(0, 0, 50, 60);
//    button.backgroundColor  = [UIColor orangeColor];
//    [button setTitle:[NSString stringWithFormat:@"Button%@",@(face)] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [faceView addSubview:button];
    
    [self.containerView addSubview:faceView];
    
    CGSize containerSize = self.containerView.frame.size;
    faceView.center = CGPointMake(containerSize.width/2.0, containerSize.height/2.0);
    faceView.layer.transform = transform3D;
}

- (void)buttonClick:(UIButton *)btn{
    NSLog(@"只是点击%@",@(btn.tag));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.mArray = [[NSMutableArray alloc]init];
    
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,300, 300 )];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/500;//透视大小
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);//绕x轴
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);//绕y轴
    self.containerView.layer.sublayerTransform = perspective;
    [self.view addSubview:self.containerView];
   
    //思路：在原有位置，做移动，然后在旋转，各个面该怎么旋转，就怎么旋转
    
    //add cube face 1,z方向移动100
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    
    //add cube face 2 x方向移动100
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];

    //add cube face 5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];

    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
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
