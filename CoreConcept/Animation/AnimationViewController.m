//
//  AnimationViewController.m
//  testdown
//
//  Created by rjb on 2018/5/17.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "AnimationViewController.h"
#import "AnimationLayer.h"

@interface AnimationViewController ()<CALayerDelegate>
@property (nonatomic, strong) AnimationLayer *customLayer;
@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.delegate = self;
    
    self.customLayer = [AnimationLayer layer];
    self.customLayer.frame = CGRectMake(0, 0, 20, 20);
    self.customLayer.backgroundColor = [UIColor redColor].CGColor;
    self.customLayer.customPath = self.customPath;
    [self.view.layer addSublayer:self.customLayer];
//    self.view actionForLayer:<#(nonnull CALayer *)#> forKey:<#(nonnull NSString *)#>
//    CACurrentMediaTime();
//    CATransaction
    
//    CAMediaTiming
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddCurveToPoint(path, NULL, 11, 86, 81, 16, 200, 200);
    
    CGContextAddPath(ctx, path);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 0, 1);
    CGContextStrokePath(ctx);
}

- (void)addAin {
    CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.duration = 5.0;
    theAnimation.path = self.customPath;
    [self.customLayer addAnimation:theAnimation forKey:@"position"];
//    CAAction
//    theAnimation runActionForKey:<#(nonnull NSString *)#> object:<#(nonnull id)#> arguments:<#(nullable NSDictionary *)#>

    //我在master修改的bug6：

    
    //修改bug4

    //修改bug5

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addAin];
}

- (CGMutablePathRef)customPath {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddCurveToPoint(path, NULL, 11, 86, 81, 16, 200, 200);
    //修改2
    return path;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //修改4
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self addAin];
//    [self.customLayer setNeedsDisplay];
//}

@end
