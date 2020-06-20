//
//  PointFigureView.m
//  FigurePoint
//
//  Created by rjb on 2020/6/2.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "PointFigureView.h"

static CGFloat kleftWeight = 40;
static int kfontSize = 9;
@interface PointFigureView ()
@property (nonatomic, strong)UIScrollView *pointScrollView;
@end

@implementation PointFigureView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self  = [super initWithFrame:frame]){
        _processer = [[PointFigureDataProcesser alloc]init];
    }
    return self;
}

- (void)printFigure {
    if(self.pointScrollView){
        [self.pointScrollView removeFromSuperview];
        self.pointScrollView = nil;
    }
    if(self.pointScrollView == nil){
        self.pointScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - kleftWeight,self.bounds.size.height)];
        if (@available(iOS 11.0, *)) {
            self.pointScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
        [self addSubview:self.pointScrollView];
    }
    
    
    CGFloat lineHeigh = self.frame.size.height/self.processer.figurePointArray.count;
    self.pointScrollView.scrollEnabled = YES;
    self.pointScrollView.backgroundColor = [UIColor whiteColor];
    //打印点数图
    int maxDepth = 0;
    for (int i = 0; i< self.processer.figurePointArray.count; i++) {
        UILabel *zhongLabel =  [self zhongLabel:lineHeigh index:i left:YES];
        [self.pointScrollView addSubview:zhongLabel];
        if (i %2 == 0) {
            zhongLabel.backgroundColor = [UIColor lightGrayColor];
        }else {
            zhongLabel.backgroundColor = [UIColor darkGrayColor];
        }
        
        UILabel *rightzhongLabel =  [self zhongLabel:lineHeigh index:i left:NO];
        if (i %2 == 0) {
            rightzhongLabel.backgroundColor = [UIColor lightGrayColor];
        }else {
            rightzhongLabel.backgroundColor = [UIColor darkGrayColor];
        }
        [self addSubview:rightzhongLabel];
        
        
        
        NSMutableArray *lineArray = self.processer.figurePointArray[i];
        for (int j  = 0; j<lineArray.count ; j++) {
            FigurePoint *figurePoint = lineArray[j];
            if (figurePoint.type == -1) {
                printf(" ");
            }else{
                printf("%s",figurePoint.type ==0 ?"o":"x");
            }
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(j * lineHeigh + kleftWeight, i* lineHeigh, lineHeigh, lineHeigh)];
            label.font = [UIFont systemFontOfSize:kfontSize];
            label.textAlignment = NSTextAlignmentCenter;
            NSString *title = @"";
            if(figurePoint.type == 0){
                title = @"O";
                label.textColor = [UIColor blueColor];
            }else if(figurePoint.type == 1){
                title = @"X";
                label.textColor = [UIColor redColor];
            }
            label.text = title;
            [self.pointScrollView addSubview:label];
            if(figurePoint.depth > maxDepth){
                maxDepth = figurePoint.depth;
            }
        }
    }
    
    self.pointScrollView.contentSize = CGSizeMake((maxDepth + 1) * lineHeigh + kleftWeight, self.bounds.size.height);
}

- (UILabel *)zhongLabel:(CGFloat)lineHeigh index:(int)i left:(BOOL)leftZhong{
    UILabel *zhongLabel = [[UILabel alloc]init];
    zhongLabel.textAlignment = NSTextAlignmentLeft;
    zhongLabel.font = [UIFont systemFontOfSize:kfontSize];
    int zhongTitle = ((int)self.processer.maxAll/self.processer.gezhi -i) *self.processer.gezhi;
    zhongLabel.text = [NSString stringWithFormat:@"%d", zhongTitle];
    if(leftZhong){
         zhongLabel.frame = CGRectMake(0, i * lineHeigh, kleftWeight, lineHeigh);
    }else{
        
          zhongLabel.frame = CGRectMake(self.frame.size.width - kleftWeight, i * lineHeigh, kleftWeight, lineHeigh);
    }
   
    return zhongLabel;
}

- (UIImage *)genaralFigureImage {
    return [self captureScrollView:self.pointScrollView];
}

-(UIImage *)captureScrollView:(UIScrollView *)scrollView{
    UIImage* image = nil;
    UIGraphicsBeginImageContext(scrollView.contentSize);
    {
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.frame.size.height);
        UIGraphicsBeginImageContextWithOptions(scrollView.frame.size, NO, [UIScreen mainScreen].scale);
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}

@end
