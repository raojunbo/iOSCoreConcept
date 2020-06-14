//
//  PointFigureView.m
//  FigurePoint
//
//  Created by rjb on 2020/6/2.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "PointFigureView.h"

@interface PointFigureView ()
@property (nonatomic, strong)UIScrollView *pointScrollView;
@end
@implementation PointFigureView

- (void)setProcesser:(PointFigureDataProcesser *)processer {
    _processer = processer;
    
    [self printFigure];
}

- (void)printFigure {
    if (self.pointScrollView) {
        for (int i = 0; i< self.pointScrollView.subviews.count; i++) {
            id view = self.pointScrollView.subviews[i];
            [view removeFromSuperview];
        }
    }else {
        self.pointScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(40, 0, [UIScreen mainScreen].bounds.size.width - 40,self.bounds.size.height)];
        if (@available(iOS 11.0, *)) {
            self.pointScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
        [self addSubview:self.pointScrollView];
    }
    
    CGFloat lineHeigh = self.frame.size.height/self.processer.figurePointArray.count;
    self.pointScrollView.scrollEnabled = YES;
    self.pointScrollView.backgroundColor = [UIColor clearColor];
    //打印点数图
    int maxDepth = 0;
    for (int i = 0; i< self.processer.figurePointArray.count; i++) {
        UILabel *zhongLabel =  [self zhongLabel:lineHeigh index:i];
        [self addSubview:zhongLabel];
        if (i %2 == 0) {
            zhongLabel.backgroundColor = [UIColor lightGrayColor];
        }else {
            zhongLabel.backgroundColor = [UIColor darkGrayColor];
        }
        
        NSMutableArray *lineArray = self.processer.figurePointArray[i];
        for (int j  = 0; j<lineArray.count ; j++) {
            FigurePoint *figurePoint = lineArray[j];
            if (figurePoint.type == -1) {
                printf(" ");
            }else{
                printf("%s",figurePoint.type ==0 ?"o":"x");
            }
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(j * lineHeigh, i* lineHeigh, lineHeigh, lineHeigh)];
            label.textAlignment = NSTextAlignmentCenter;
            NSString *title = @"";
            if(figurePoint.type == 0){
                title = @"O";
            }else if(figurePoint.type == 1){
                title = @"X";
            }
            label.text = title;
            [self.pointScrollView addSubview:label];
            if(figurePoint.depth > maxDepth){
                maxDepth = figurePoint.depth;
            }
        }
    }
    
    self.pointScrollView.contentSize = CGSizeMake((maxDepth + 1) * lineHeigh, self.bounds.size.height);
}

- (UILabel *)zhongLabel:(CGFloat)lineHeigh index:(int)i {
    UILabel *zhongLabel = [[UILabel alloc]init];
    zhongLabel.textAlignment = NSTextAlignmentLeft;
    zhongLabel.font = [UIFont systemFontOfSize:8];
    int zhongTitle = ((int)self.processer.maxAll/self.processer.gezhi -i) *self.processer.gezhi;
    zhongLabel.text = [NSString stringWithFormat:@"%d", zhongTitle];
    zhongLabel.frame = CGRectMake(0, i * lineHeigh, 40, lineHeigh);
    return zhongLabel;
}

@end
