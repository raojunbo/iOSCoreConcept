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

@interface FigurePoint2ViewController ()
@property (nonatomic,strong) PointFigureView *figureView;
@property (nonatomic, strong) UIButton *button;
@end

@implementation FigurePoint2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.figureView = [[PointFigureView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 400)];
    self.figureView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.figureView];
    
    [[HTTPTool tool] getData:@"" complation:^(NSArray<KLineModel *> * _Nonnull models) {
        PointFigureDataProcesser *processer = [[PointFigureDataProcesser alloc]init];
        processer.gezhi = 500;
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int i = 0; i<models.count; i++) {
            KLineModel *model = models[i];
            [array addObject:model];
        }
        processer.pointArray = array;
        
        self.figureView.processer = processer;
    }];
    
    self.button.frame = CGRectMake(0, 64, 100, 50);
    [self.button setTitle:@"保存为图片" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(saveToImage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveToImage {
    UIGraphicsBeginImageContextWithOptions(self.figureView.pointScrollView.contentSize, self.figureView.pointScrollView.opaque, 0.0);
    
    UIGraphicsBeginImageContext(self.figureView.pointScrollView.contentSize);
    self.figureView.pointScrollView.contentOffset = CGPointZero;
    [self.figureView.pointScrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
    self.figureView.pointScrollView.frame = CGRectMake(0, 0, self.figureView.pointScrollView.contentSize.width, self.figureView.pointScrollView.contentSize.height);

    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData* imageData =  UIImagePNGRepresentation(image);
    UIImage* newImage = [UIImage imageWithData:imageData];
    UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil);//然后将该图片保存到图片图
}

- (UIButton *)button {
    if(!_button){
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _button;
}

@end
