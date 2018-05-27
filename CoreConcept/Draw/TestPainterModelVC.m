//
//  TestPainterModelVC.m
//  testdown
//
//  Created by rjb on 2017/12/1.
//  Copyright © 2017年 rjb. All rights reserved.
//

#import "TestPainterModelVC.h"

@interface TestPainterModelVC ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation TestPainterModelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor purpleColor];
    self.imageView.image = [self buildRabitImage];
    // Do any additional setup after loading the view.
}

- (UIImage *)buildImage{
    CGRect rect = CGRectMake(0, 0, 200, 200);
    UIBezierPath *shap1 = [UIBezierPath bezierPathWithOvalInRect:rect];
    rect.origin.x += 100;
    UIBezierPath *shap2 = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    UIGraphicsBeginImageContext(CGSizeMake(300, 300));
    [shap1 fill];
    
    [[UIColor redColor]set];
    [shap2 setLineWidth:10];
    [shap2 fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIImage *)buildRabitImage{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), YES, 2);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor greenColor] setFill];
    [[UIColor purpleColor] setStroke];
    CGRect rect = CGRectMake(0, 0, 100, 100);
    
    UIBezierPath *shap1 = [UIBezierPath bezierPathWithOvalInRect:rect];
    [shap1 fill];
    [shap1 stroke];
    
    CGContextSaveGState(context);//压入state
    
    [[UIColor orangeColor] setFill];
    [[UIColor blueColor] setStroke];
    
    [shap1 applyTransform:CGAffineTransformMakeTranslation(0, 30)];
    [shap1 fill];
    [shap1 stroke];
    
    CGContextRestoreGState(context);//弹出state
    
    [shap1 applyTransform:CGAffineTransformMakeTranslation(0, 30)];
    [shap1 fill];
    [shap1 stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
