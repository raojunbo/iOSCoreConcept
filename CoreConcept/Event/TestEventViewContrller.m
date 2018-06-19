//
//  TestEventViewContrller.m
//  testdown
//
//  Created by rjb on 2018/4/11.
//  Copyright © 2018年 rjb. All rights reserved.
//
#import "Masonry.h"
#import "TestEventViewContrller.h"

#define KBLog_F(fmt, ...) NSLog((@"%s," "[lineNum:%d]" fmt) , __FUNCTION__, __LINE__, ##__VA_ARGS__); //带函数名和行数
#define KBLog_L(fmt, ...) NSLog((@"===[lineNum:%d]" fmt), __LINE__, ##__VA_ARGS__);  //带行数
#define KBLog_C(fmt, ...) NSLog((fmt), ##__VA_ARGS__); //不带函数名和行数
/*
 事件处理
 1：响应链条的建立
 每个view都有自己的superView，包括controller的topmost view(controller的self.view)。当一个view被add到superView上的时候，他的nextResponder属性就会被指向它的superView，当controller被初始化的时候，self.view(topmost view)的nextResponder会被指向所在的controller，而controller的nextResponder会被指向self.view的superView，这样，整个app就通过nextResponder串成了一条链，也就是我们所说的响应链。
 2：hit -test-view（找view是按视图层级从父向子找）
 有了事件响应链，接下来的事情就是寻找响应事件的具体响应者了，我们称着为：Hit-Testing View。
 调用结束并且hit-test view确定之后，这个view和view上面依附的手势，都会和一个UITouch的对象关联起来
 递归是向界面的根节点UIWindow发送hitTest:withEvent:消息开始的，从这个消息返回的是一个UIView，也就是手指当前位置最前面的那个 hittest view。 当向UIWindow发送hitTest:withEvent:消息时，hitTest:withEvent:里面所做的事，就是判断当前的点击位置是否在window里面，如果在则遍历window的subview然后依次对subview发送hitTest:withEvent:消息(注意这里给subview发送消息是根据当前subview的index顺序，index越大就越先被访问)。如果当前的point没有在view上面，那么这个view的subview也就不会被遍历了
 3.事件在响应者间传递(响应式按响应链条回溯)
 UIResponder里面touch四个阶段的方法里面，实际上是什么事都没有做的，UIView继承了它进行重写，重写的内容也是没有什么东西，就是把事件传递给nextResponder，比如：[self.nextResponder touchesBegan:touches withEvent:event]。所以当一个view或者controller里面没有重写touch事件，那么这个事件就会一直传递下去，直到UIApplication，这也就是事件往上冒泡的原理
 如果view重写了touch方法，我们一般会看到的效果是，这个view响应了事件之后，事件就被截断了
 */

@interface AView : UIView

@end

@implementation AView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        
        
    }
    return self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    KBLog_F();
}
@end

@interface BView : UIView

@end

@implementation BView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    KBLog_F();
}
@end

@interface CView: UIView
@property (nonatomic, strong) UIButton *testButton;
@end

@implementation CView: UIView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self addSubview:self.testButton];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if(!self.isUserInteractionEnabled ||self.isHidden){
        return nil;
    }
    for (UIView *sub in self.subviews) {
        if(sub == self.testButton){
            return nil;
        }
    }
    return [super hitTest:point withEvent:event];
}

- (UIButton *)testButton {
    if(!_testButton){
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_testButton setTitle:@"点击" forState:UIControlStateNormal];
        _testButton.frame = CGRectMake(0, 0, 50, 30);
        _testButton.backgroundColor = [UIColor redColor];
        [_testButton addTarget:self action:@selector(testButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testButton;
}

- (void)testButtonClick {
    NSLog(@"点击了");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    KBLog_F();
}

@end

@interface TestEventViewContrller ()
@property (nonatomic, strong) AView *AblueView;
@property (nonatomic, strong) BView *BredView;
@property (nonatomic, strong) CView *CyellowView;
@end

@implementation TestEventViewContrller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.AblueView];
    [self.AblueView addSubview:self.BredView];
    [self.BredView addSubview:self.CyellowView];
    
    [self.AblueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.center.equalTo(self.view);
    }];
    
    [self.BredView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.center.equalTo(self.AblueView);
    }];
    
    [self.CyellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.centerY.equalTo(self.BredView.mas_top);
        make.centerX.equalTo(self.BredView);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (AView *)AblueView {
    if(!_AblueView){
        _AblueView = [[AView alloc]init];
        _AblueView.backgroundColor = [UIColor blueColor];
    }
    return _AblueView;
}

- (BView *)BredView {
    if(!_BredView){
        _BredView = [[BView alloc]init];
        _BredView.backgroundColor = [UIColor redColor];
    }
    return _BredView;
}

- (CView *)CyellowView {
    if(!_CyellowView){
        _CyellowView = [[CView alloc]init];
        _CyellowView.backgroundColor = [UIColor yellowColor];
    }
    return _CyellowView;
}

@end
