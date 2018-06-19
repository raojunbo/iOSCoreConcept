//
//  TestConstraintsViewController.m
//  CoreConcept
//
//  Created by rjb on 2018/6/15.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "TestConstraintsViewController.h"

@interface TestConstraintsViewController ()
@property (nonatomic, strong)UIView *viewA;
@property (nonatomic, strong)UIView *viewB;
@property (nonatomic, strong)UIButton *button;

@property (nonatomic, strong)UIButton *testButton;
@end

@implementation TestConstraintsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*一：布局约束*/
    /*
    priority,
    firstItem,secondItem,
    firstAttribute,secondAtribute,
    relation,
    multiplier,
    constant,
     */
    /* Create constraints explicitly.  Constraints are of the form "view1.attr1 = view2.attr2 * multiplier + constant"
     If your equation does not have a second view and attribute, use nil and NSLayoutAttributeNotAnAttribute.
     */
//    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.viewA attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.viewB attribute:NSLayoutAttributeWidth multiplier:3 constant:0];
//
//    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.viewA attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.viewB attribute:NSLayoutAttributeWidth multiplier:2.0 constant:0];
//
//    //为什么是将约束加到self.view上，我的理解，约束是对子元素的，从这里可以看出，约束是加到指定的view
//    [self.view addConstraint:constraint1];
//    [self.view addConstraint:constraint2];
    //一元约束
    NSLayoutConstraint *oneConstraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:nil attribute:nil multiplier:1 constant:100];
    
    /*二：内容大小
     并不是所有的视图都有intrinsicContentSize。有些没内容的UIViewNoIntrinsicMetric
     
     */
//    [self.view addSubview:self.button];
//    [self.button setTitle:@"你" forState:UIControlStateNormal];
   
//    NSLog(@"前%@",@( self.button.intrinsicContentSize));
//      [self.button setTitle:@"你好吗" forState:UIControlStateNormal];
//     NSLog(@"后%@",@(self.button.intrinsicContentSize));
    
    /*三：压缩阻力
     压缩阻力主要是针对于有内容大小的视图。顾明思议是指视图保护器内容的方式，主要是抗压缩
     */
    
    //示例,在水平方向的压缩阻力优先级高，意思是我抗压缩，谁也别想压缩我。以下是设置优先级的api
//    [self.button setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
    
    /*四：内容吸附
     较高的内容吸附优先级可以防止视图比其他呈现的内容扩大太多。意思是，尽管有其他地方可以供我拉伸，但我就喜欢适应我自身内容大小，怎么地了吧！
     */
//    [self.button setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.view addSubview:self.testButton];
    [self.testButton setTitle:@"饶" forState:UIControlStateNormal];
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.testButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.testButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.testButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    leftConstraint.priority = UILayoutPriorityDefaultLow ;
    rightConstraint.priority = UILayoutPriorityDefaultLow ;
    
    NSLog(@"默认的优先级%@", @(topConstraint.priority));//默认的优先级是1000;
    /*五，优先级(很精妙)
     创建的属性的约束默认是1000,也就是最高的。 A required constraint.  Do not exceed this.不要超过这个优先级
     可以通过对创建的优先级设置priority,来比较谁的权限更高
     //     [self.testButton setContentHuggingPriority:<#(UILayoutPriority)#> forAxis:<#(UILayoutConstraintAxis)#>
     它的默认权限是250
     
     [self.testButton setContentCompressionResistancePriority:<#(UILayoutPriority)#> forAxis:<#(UILayoutConstraintAxis)#>]
     它的默认是750
     
     所以在设置优先级时，实际是“普通创建的布局约束默认1000”,"NSContentSizeLayoutConstraint内容大写的约束默认1000",压缩阻力，内容吸附几个优先级的比较。
     
     苹果公司提供的优先级枚举
     static const UILayoutPriority UILayoutPriorityRequired NS_AVAILABLE_IOS(6_0) = 1000;
     static const UILayoutPriority UILayoutPriorityDefaultHigh NS_AVAILABLE_IOS(6_0) = 750;
     static const UILayoutPriority UILayoutPriorityDefaultLow NS_AVAILABLE_IOS(6_0) = 250;
     static const UILayoutPriority UILayoutPriorityFittingSizeLevel NS_AVAILABLE_IOS(6_0) = 50;
     
     */
    [self.view addConstraint:leftConstraint];
    [self.view addConstraint:rightConstraint];
    [self.view addConstraint:topConstraint];
    
    /*
     在iOS中的核心约束类
     布局约束        NSLayoutConstraint
     内容大小约束     NSContentSizeLayoutConstraint类 私有
     自动尺寸调整约束  NSAutoresizingMaskLayoutConstraint
     布局支持约束     UILayoutSupportConstraint类 私有
     原型约束        NSIBProtoyingLayoutConstraint类 私有
     
     说明
     1.NSAutoresizingMaskLayoutConstraint autoLayout将使用自动尺寸调整转换成相应的约束。这在与“自动尺寸”同时使用时出现
     2.NSContentSizeLayoutConstraint 带内容的入，label,button,uiimageview
     3.
     
     */
    
    
    /* 约束，层次结构与边界系统
     当约束引用两个视图时，这两个视图一定要属于同一个层次结构。
     一是，一个视图是另一个视图的父视图
     二是,他们必须有一个共同的非nil的父视图
     如果是两个兄弟视图之间的约束，需要将约束添加到共同的父视图上（你若果不加到共同的父视图上，在计算时，压根就找不到一个视图，怎么计算，是吧）。若果是一元的，添加到自身。
     (在marory中,会通过寻找两个父视图之间的公共祖先，并将约束添加到该父视图上)
     以上两个很关键，否则，会出现奔溃。
     */
    
    /*布局约束法则
     
     
     */
    
}

- (UIButton *)testButton {
    if(!_testButton){
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _testButton.translatesAutoresizingMaskIntoConstraints = NO;
        /*
         错误的解决
          "<NSAutoresizingMaskLayoutConstraint:0x608000092f20 UIButton:0x7fe3a1428cb0.(null) == 0>",
         */
        //放弃autoresizing布局的结果所产生的约束,也就是放弃这个约束NSAutoresizingMaskLayoutConstraint
        _testButton.backgroundColor = [UIColor redColor];
    }
    return _testButton;
}
- (UIButton *)button {
    if(!_button){
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _button;
}

- (UIView *)viewB {
    if(!_viewB){
        _viewB = [[UIView alloc]init];
    }
    return _viewB;
}

- (UIView *)viewA {
    if(!_viewA){
        _viewA = [[UIView alloc]init];
    }
    return _viewA;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
