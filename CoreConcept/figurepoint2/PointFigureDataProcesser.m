//
//  PointFigureDataManager.m
//  FigurePoint
//
//  Created by rjb on 2020/6/2.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "PointFigureDataProcesser.h"

@implementation FigurePoint

@end

@interface PointFigureDataProcesser ()

@end
@implementation PointFigureDataProcesser
- (instancetype)init {
    if(self = [super init]){
        
        _figurePointArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)build {
    [self buildFigurePointArray];
    [self fillFigure];
    [self reversePoint];
    [self printFigure];
}


- (void)reversePoint {
    //将点数图倒置
    for (int i = 0; i< self.figurePointArray.count/2; i++) {
        NSMutableArray *mFirstArray = self.figurePointArray[i];
        NSMutableArray *mSecondArray = self.figurePointArray[self.figurePointArray.count-i-1];
        NSMutableArray *tmp = mFirstArray;
        
        self.figurePointArray[i] = mSecondArray;
        self.figurePointArray[self.figurePointArray.count-i-1] = tmp;
    }
}

- (void)printFigure {
    //打印点数图
    for (int i = 0; i< self.figurePointArray.count; i++) {
        //         printf("%d",((int)self.minAll/self.gezhi + i) *self.gezhi);
        printf("%d",((int)self.maxAll/self.gezhi -i) *self.gezhi);
        NSMutableArray *lineArray = self.figurePointArray[i];
        for (int j  = 0; j<lineArray.count ; j++) {
            FigurePoint *figurePoint = lineArray[j];
            if (figurePoint.type == -1) {
                printf(" ");
            }else{
                printf("%s",figurePoint.type ==0 ?"o":"x");
            }
        }
        printf("\n");
    }
}

- (void)fillFigure {
    //填充点数图
    int type = 1;//0表示o,1表示x,-1表示为填写
    int depth = 0;//向右的深度
    CGFloat lastColumnMax = 0;//上列的最大值
    CGFloat lastColumnMin = 0;//上列的最小值
//
    for (int i = 0; i<self.pointArray.count; i++) {
        KLineModel *currentEntity = self.pointArray[i];
        if (i == 0) {
            [self checkPointMergeFirst:currentEntity depath:depth type:type];
            type = 1;
            lastColumnMax = currentEntity.high;
            lastColumnMin = currentEntity.low;
        }else{
            //当前是上涨列；
            if(type == 1){
                if([self checkNewHigh:currentEntity lastColumMax:lastColumnMax depth:depth]){
                    //查看当前数据的最高价是否可以追加上涨；
                    [self checkPointMergeNewHigh:currentEntity lastColumMin:lastColumnMin depth:depth type:type];
                    lastColumnMax = currentEntity.high;
                }else if([self checkUpToDown:currentEntity withLastColumnMax:lastColumnMax]){
                    //没有形成新的高价时。最低价是否比最高价小于一级。也就是向下订单动力有多强
                    if(![self checkColumnHadOnlyOne:depth]){
                        depth = depth + 1;
                    }
                    type = 0;
                    [self fillUpToDown:currentEntity withLastColumMax:lastColumnMax depth:depth type:type];
                    lastColumnMax = currentEntity.high;
                    lastColumnMin = currentEntity.low;
                }else{
                    //什么也不做
                }
            }else{
                //当前列是下降
                if([self checkNewLow:currentEntity lastColumMin:lastColumnMin depth:depth]){
                    //当前的下降列，是否形成新低
                    [self checkPointMergeNewLow:currentEntity lastColumMax:lastColumnMax depth:depth type:type];
                    lastColumnMin = currentEntity.low;
                }else if([self checkDownToUp:currentEntity withLastColumMin:lastColumnMin]){
                    //没有形成新低时。最高价是否比最低价小于一级。就会出现反转
                    if(![self checkColumnHadOnlyOne:depth]){
                        //判定当前列是否只有一个点；只有一个点时；depth不变；
                        //depth 不走
                        depth = depth + 1;
                    }
                    type = 1;
                    [self fillDownToUp:currentEntity withLastColumMin:lastColumnMin depth:depth type:type];
                    
                    lastColumnMin = currentEntity.low;
                    lastColumnMax = currentEntity.high;
                }else {
                    //什么也不做
                }
            }
        }
    }
}

- (BOOL)checkColumnHadOnlyOne:(int)depth {
    int noEmptyCount = 0;
    for (int i = 0; i< self.figurePointArray.count; i++) {
        NSMutableArray *lineArray = self.figurePointArray[i];
        FigurePoint *figurePoint = lineArray[depth];
        if (figurePoint.type == 1 || figurePoint.type == 0) {
            noEmptyCount++;
        }
    }
    if (noEmptyCount<=1) {
        return YES;
    }else{
        return NO;
    }
}
#pragma 初始化

- (void)checkPointMergeFirst:(KLineModel *)currentEntity depath:(int)depth type:(int)type {
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;
    int minIndex = (currentEntity.low - minAllzheng)/self.gezhi;//小值向上取整
    int maxIndex = (currentEntity.high - minAllzheng)/self.gezhi;//大值向下取整
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}

#pragma 当前是上升
- (BOOL)checkNewHigh:(KLineModel *)currentEntity lastColumMax:(CGFloat)lastColumMax depth:(int)depth{
    int maxchu = currentEntity.high/self.gezhi;
    int maxzheng = self.gezhi *maxchu;
    
    int lastColumMaxChu =lastColumMax/self.gezhi;
    int lastColumMaxZheng = self.gezhi *lastColumMaxChu;
    if(maxzheng > lastColumMaxZheng){
        return YES;
    }else{
        return NO;
    }
}

- (void)checkPointMergeNewHigh:(KLineModel *)currentEntity lastColumMin:(CGFloat)lastColumMin depth:(int)depth type:(int)type{
    //lastColumnMin 防止向下赋值超出
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;
    int minIndex = (lastColumMin - minAllzheng)/self.gezhi + 1;//小值向上取整
    int maxIndex = (currentEntity.high - minAllzheng)/self.gezhi;//大值向下取整
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}

- (BOOL)checkUpToDown:(KLineModel *)currentEntity withLastColumnMax:(CGFloat)lastColumnMax {
    //当前的最小值，是否小于等于此高格值
    int lastColumnCigaochu = lastColumnMax/self.gezhi;
    int lastColumnCigaozheng = lastColumnCigaochu * self.gezhi;
    //主要目的是能不能形成反转
    if(currentEntity.low < lastColumnCigaozheng){
        return YES;
    }else{
        return NO;
    }
}

- (void)fillUpToDown:(KLineModel *)currentEntity withLastColumMax:(CGFloat)lastColumnMax depth:(int)depth type:(int)type {
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;
    
    int lastColumnchu = lastColumnMax/self.gezhi;
    int lastColumnzheng = lastColumnchu * self.gezhi;
    //上次最高的次高
    int maxIndex =  (lastColumnzheng - minAllzheng)/self.gezhi - 1;
    
    //最小的坐标
    int lowchu = currentEntity.low/self.gezhi;
    int lowzheng = lowchu *self.gezhi;
    
    int minIndex = (lowzheng - minAllzheng)/self.gezhi;
    
    //从哪到哪都包括；
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}


#pragma 当前是下降
- (BOOL)checkNewLow:(KLineModel *)currentEntity lastColumMin:(CGFloat)lastColumnMin depth:(int)depth {
    int minchu = currentEntity.low/self.gezhi;
    int minzheng = self.gezhi *minchu;
    
    int lastColumMinChu =lastColumnMin/self.gezhi;
    int lastColumMinZheng = self.gezhi *lastColumMinChu;
    if(minzheng < lastColumMinZheng){
        return YES;
    }else{
        return NO;
    }
}

- (void)checkPointMergeNewLow:(KLineModel *)currentEntity lastColumMax:(CGFloat)lastColumMax depth:(int)depth type:(int)type{
    //lastColumnMin 防止向下赋值超出
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;
    
    int minIndex = (currentEntity.low - minAllzheng)/self.gezhi;
    
    int maxChu = lastColumMax/self.gezhi;
    int maxzheng = maxChu *self.gezhi;
    
    int maxIndex = (maxzheng - minAllzheng)/self.gezhi -1;//大值向下取整(这里的-1表示追加的范围不能是上列的最大值，只能是二级值)
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}

- (BOOL)checkDownToUp:(KLineModel *)currentEntity withLastColumMin:(CGFloat)lastColumnMin{
    //从下降到上升；最大值是否大于次低点；
    CGFloat lastColumnCidi =  lastColumnMin + self.gezhi;
    int lastColumnCidichu = lastColumnCidi/self.gezhi;
    int lastColumnCidizheng = lastColumnCidichu *self.gezhi;
    
    if(currentEntity.high >= lastColumnCidizheng){
        return YES;
    }else{
        return NO;
    }
}

- (void)fillDownToUp:(KLineModel *)currentEntity withLastColumMin:(CGFloat)lastColumnMin depth:(int)depth type:(int)type {
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;

    //次低
    int lastColumnchu = lastColumnMin/self.gezhi;
    int lastColumnzheng =  lastColumnchu * self.gezhi;
    int minIndex = (lastColumnzheng - minAllzheng)/self.gezhi + 1;
    
    //最高
    int maxIndex = (currentEntity.high - minAllzheng)/self.gezhi;
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}

- (void)realFillPoint:(int)minIndex maxZheng:(int)maxIndex depth:(int)depth type:(int)type {
    //在列depth上，从minindex到maxIndex进行赋值
    for (int i = minIndex; i<=maxIndex ; i++) {
        NSMutableArray *lineArray = self.figurePointArray[i];
        FigurePoint *figurePoint = lineArray[depth];
        figurePoint.type = type;
        figurePoint.depth = depth;
    }
}

- (void)buildFigurePointArray {
    //1. 找到最高点
    //2. 找到最低点
    KLineModel *firstKLineModel = self.pointArray.firstObject;
    CGFloat max = firstKLineModel.high;
    CGFloat min = firstKLineModel.low;
    for (int i = 0; i< self.pointArray.count; i++) {
        KLineModel *point = self.pointArray[i];
        if(point.low<min){
            min = point.low;
        }
        if(point.high > max){
            max = point.high;
        }
    }
    int maxzheng = max / self.gezhi;
    int minzheng = min / self.gezhi;
    
    for (int i = 0; i<= maxzheng - minzheng; i++) {
        NSMutableArray *oneLineArray = [[NSMutableArray alloc]init];
        for (int j = 0;j< self.pointArray.count; j++) {
            FigurePoint *figurePoint = [[FigurePoint alloc]init];
            figurePoint.type = -1;
            figurePoint.depth = 0;
            [oneLineArray addObject:figurePoint];
        }
        [self.figurePointArray addObject:oneLineArray];
    }
    self.minAll = min;
    self.maxAll = max;
    
    NSLog(@"最小值:%f",self.minAll);
    NSLog(@"最大值:%f",self.maxAll);
}

- (void)setPointArray:(NSArray<KLineModel *> *)pointArray {
    _pointArray = pointArray;
     [_figurePointArray removeAllObjects];
    [self build];
}

@end
