//
//  FigurePoint2ViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/6/1.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "FigurePoint2ViewController.h"
#import "HTTPTool.h"
#import "PointFigureView.h"
#import "PointFigureDataProcesser.h"
#import "UIView+Utils.h"

static int KnavigationTop = (64 + 20);
static int kPointFigureHeigh = 600;
@interface FigurePoint2ViewController ()
@property (nonatomic,strong) PointFigureView *figureView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITextField *gezhiTextField;
@property (nonatomic, strong) UITextField *symbolTextField;

@property (nonatomic, strong) UIButton *zhouqiButton;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) NSString *zhouqiStr;
@end

@implementation FigurePoint2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"点数图";
    self.view.backgroundColor = [UIColor whiteColor];
  
    self.zhouqiStr = @"4hour";
    [self.view addSubview:self.gezhiTextField];
    self.gezhiTextField.top = KnavigationTop;
    
    [self.view addSubview:self.symbolTextField];
    self.symbolTextField.top = KnavigationTop;
    self.symbolTextField.left = self.gezhiTextField.right + 10;
    
    [self.view addSubview:self.zhouqiButton];
    self.zhouqiButton.top = KnavigationTop;
    self.zhouqiButton.left = self.symbolTextField.right + 10;
    
    [self.view addSubview:self.figureView];
    self.figureView.top = self.gezhiTextField.bottom + 10;

    [self.view addSubview:self.sureButton];
    self.sureButton.top = KnavigationTop;
    self.sureButton.left = self.zhouqiButton.right + 10;
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.button];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)requestData {
    int gezhi =  [self.gezhiTextField.text intValue];
    NSString *symbol = self.symbolTextField.text;
    [[HTTPTool tool] getData:self.zhouqiStr symbol:symbol complation:^(NSArray<KLineModel *> * _Nonnull models) {
        self.figureView.processer.gezhi = gezhi;
        self.figureView.processer.pointArray = [models copy];
        [self.figureView printFigure];
    }];
}

- (void)saveImage {
    UIImage *image =  [self.figureView genaralFigureImage];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

- (PointFigureView *)figureView {
    if(!_figureView){
        _figureView = [[PointFigureView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kPointFigureHeigh)];
        _figureView.backgroundColor = [UIColor lightGrayColor];
    }
    return _figureView;
}

- (UIButton *)button {
    if(!_button){
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(0, 0 , 100, 40);
        [_button setTitle:@"保存为图片" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(saveImage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UITextField *)gezhiTextField {
    if(!_gezhiTextField){
        _gezhiTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        _gezhiTextField.text = @"50";
        _gezhiTextField.backgroundColor = [UIColor lightGrayColor];
    }
    return _gezhiTextField;
}

- (UITextField *)symbolTextField {
    if(!_symbolTextField){
        _symbolTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 120, 40)];
        _symbolTextField.text = @"btcusdt";
        _symbolTextField.backgroundColor = [UIColor lightGrayColor];
    }
    return _symbolTextField;
}

- (UIButton *)zhouqiButton {
    if(!_zhouqiButton){
        _zhouqiButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _zhouqiButton.frame = CGRectMake(0, 64 + 20, 50, 40);
        [_zhouqiButton setTitle:self.zhouqiStr forState:UIControlStateNormal];
        [_zhouqiButton addTarget:self action:@selector(zhouqiSetClick) forControlEvents:UIControlEventTouchUpInside];
        _zhouqiButton.backgroundColor = [UIColor lightGrayColor];
    }
    return _zhouqiButton;
}

- (UIButton *)sureButton {
    if(!_sureButton){
        _sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _sureButton.frame = CGRectMake(0, 64 + 20, 50, 40);
        [_sureButton setTitle:@"绘制" forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(huizhi) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}

- (void)zhouqiSetClick {
    UIAlertController *alertvc = [UIAlertController alertControllerWithTitle:@"选择周期" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"1h" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.zhouqiStr = @"1hour";
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"4h" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         self.zhouqiStr = @"4hour";
    }];
    [alertvc addAction:action1];
    [alertvc addAction:action2];
    
    [self presentViewController:alertvc animated:YES completion:^{
        
    }];
}

- (void)huizhi {
      [self requestData];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.gezhiTextField resignFirstResponder];
    [self.symbolTextField resignFirstResponder];
}
@end
