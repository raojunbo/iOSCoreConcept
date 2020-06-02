//
//  FigurePoint2ViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/6/1.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "FigurePoint2ViewController.h"
#import "FigurePointViewController.h"

@interface FigurePoint : NSObject
@property (nonatomic, assign) int type;//类型0 或则1
@end
@implementation FigurePoint

@end

@interface FigurePoint2ViewController ()
@property (nonatomic, assign) int gezhi;
@property (nonatomic,strong)NSMutableArray *pointArray;
@property (nonatomic, strong)NSMutableArray<NSMutableArray<FigurePoint *> *> *figurePointArray;
@property (nonatomic, assign)CGFloat minAll;
@property (nonatomic, assign)CGFloat maxAll;
@end

@implementation FigurePoint2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.gezhi = 50;
    self.figurePointArray = [[NSMutableArray alloc]init];
    [self buildProceser];
}

- (void)buildProceser {
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
                printf("%d",figurePoint.type);
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
    
    for (int i = 0; i< self.pointArray.count; i++) {
        PointEntity *currentEntity = self.pointArray[i];
        if (i == 0) {
            [self checkPointMergeFirst:currentEntity depath:depth type:type];
            type = 1;
            lastColumnMax = currentEntity.max;
            lastColumnMin = currentEntity.min;
        }else{
            //当前是上涨列；
            if(type == 1){
                if([self checkNewHigh:currentEntity lastColumMax:lastColumnMax depth:depth]){
                    //查看当前数据的最高价是否可以追加上涨；
                    [self checkPointMergeNewHigh:currentEntity lastColumMin:lastColumnMin depth:depth type:type];
                    lastColumnMax = currentEntity.max;
                }else if([self checkUpToDown:currentEntity withLastColumnMax:lastColumnMax]){
                    //没有形成新的高价时。最低价是否比最高价小于一级。也就是向下订单动力有多强
                    if(![self checkColumnHadOnlyOne:depth]){
                        depth = depth + 1;
                    }
                    type = 0;
                    [self fillUpToDown:currentEntity withLastColumMax:lastColumnMax depth:depth type:type];
                    lastColumnMax = currentEntity.max;
                    lastColumnMin = currentEntity.min;
                }else{
                    //什么也不做
                }
            }else{
                //当前列是下降
                if([self checkNewLow:currentEntity lastColumMin:lastColumnMin depth:depth]){
                    //当前的下降列，是否形成新低
                    [self checkPointMergeNewLow:currentEntity lastColumMax:lastColumnMax depth:depth type:type];
                    lastColumnMin = currentEntity.min;
                }else if([self checkDownToUp:currentEntity withLastColumMin:lastColumnMin]){
                    //没有形成新低时。最高价是否比最低价小于一级。就会出现反转
                    if(![self checkColumnHadOnlyOne:depth]){
                        //判定当前列是否只有一个点；只有一个点时；depth不变；
                        //depth 不走
                        depth = depth + 1;
                    }
                    type = 1;
                    [self fillDownToUp:currentEntity withLastColumMin:lastColumnMin depth:depth type:type];
                    
                    lastColumnMin = currentEntity.min;
                    lastColumnMax = currentEntity.max;
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

- (void)checkPointMergeFirst:(PointEntity *)currentEntity depath:(int)depth type:(int)type {
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;
    int minIndex = (currentEntity.min - minAllzheng)/self.gezhi + 1;//小值向上取整
    int maxIndex = (currentEntity.max - minAllzheng)/self.gezhi;//大值向下取整
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}

#pragma 当前是上升
- (BOOL)checkNewHigh:(PointEntity *)currentEntity lastColumMax:(CGFloat)lastColumMax depth:(int)depth{
    int maxchu = currentEntity.max/self.gezhi;
    int maxzheng = self.gezhi *maxchu;
    
    int lastColumMaxChu =lastColumMax/self.gezhi;
    int lastColumMaxZheng = self.gezhi *lastColumMaxChu;
    if(maxzheng > lastColumMaxZheng){
        return YES;
    }else{
        return NO;
    }
}

- (void)checkPointMergeNewHigh:(PointEntity *)currentEntity lastColumMin:(CGFloat)lastColumMin depth:(int)depth type:(int)type{
    //lastColumnMin 防止向下赋值超出
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;
    int minIndex = (lastColumMin - minAllzheng)/self.gezhi + 1;//小值向上取整
    int maxIndex = (currentEntity.max - minAllzheng)/self.gezhi;//大值向下取整
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}

- (BOOL)checkUpToDown:(PointEntity *)currentEntity withLastColumnMax:(CGFloat)lastColumnMax {
    //当前的最小值，是否小于等于此高格值
    CGFloat lastColumnCiGao =  lastColumnMax - self.gezhi;
    int lastColumnCigaochu = lastColumnCiGao/self.gezhi;
    int lastColumnCigaozheng = lastColumnCigaochu * self.gezhi;
    
    if(currentEntity.min <= lastColumnCigaozheng){
        return YES;
    }else{
        return NO;
    }
}

- (void)fillUpToDown:(PointEntity *)currentEntity withLastColumMax:(CGFloat)lastColumnMax depth:(int)depth type:(int)type {
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;
    //最高的坐标
    CGFloat lastColumnCiGao =  lastColumnMax - self.gezhi;
    int maxIndex =  (lastColumnCiGao - minAllzheng)/self.gezhi;
    
    //最小的坐标
    int minIndex = (currentEntity.min - minAllzheng)/self.gezhi + 1;
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}


#pragma 当前是下降
- (BOOL)checkNewLow:(PointEntity *)currentEntity lastColumMin:(CGFloat)lastColumnMin depth:(int)depth {
    int minchu = currentEntity.min/self.gezhi;
    int minzheng = self.gezhi *minchu;
    
    int lastColumMinChu =lastColumnMin/self.gezhi;
    int lastColumMinZheng = self.gezhi *lastColumMinChu;
    if(minzheng < lastColumMinZheng){
        return YES;
    }else{
        return NO;
    }
}

- (void)checkPointMergeNewLow:(PointEntity *)currentEntity lastColumMax:(CGFloat)lastColumMax depth:(int)depth type:(int)type{
    //lastColumnMin 防止向下赋值超出
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;
    int minIndex = (currentEntity.min - minAllzheng)/self.gezhi + 1;//小值向上取整
    int maxIndex = (lastColumMax - minAllzheng)/self.gezhi - 1;//大值向下取整(这里的-1表示追加的范围不能是上列的最大值，只能是二级值)
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}

- (BOOL)checkDownToUp:(PointEntity *)currentEntity withLastColumMin:(CGFloat)lastColumnMin{
    //从下降到上升；最大值是否大于次低点；
    CGFloat lastColumnCidi =  lastColumnMin + self.gezhi;
    int lastColumnCidichu = lastColumnCidi/self.gezhi;
    int lastColumnCidizheng = lastColumnCidichu *self.gezhi;
    
    if(currentEntity.max >= lastColumnCidizheng){
        return YES;
    }else{
        return NO;
    }
}

- (void)fillDownToUp:(PointEntity *)currentEntity withLastColumMin:(CGFloat)lastColumnMin depth:(int)depth type:(int)type {
    int minAllzheng = ((int)self.minAll/self.gezhi) *self.gezhi;
    //次低
    CGFloat lastColumnCidi =  lastColumnMin + self.gezhi;
    int minIndex =  (lastColumnCidi - minAllzheng)/self.gezhi + 1;
    
    
    //最高
    int maxIndex = (currentEntity.max - minAllzheng)/self.gezhi;
    [self realFillPoint:minIndex maxZheng:maxIndex depth:depth type:type];
}

- (void)realFillPoint:(int)minIndex maxZheng:(int)maxIndex depth:(int)depth type:(int)type {
    //在列depth上，从minindex到maxIndex进行赋值
    for (int i = minIndex; i<=maxIndex ; i++) {
        NSMutableArray *lineArray = self.figurePointArray[i];
        FigurePoint *figurePoint = lineArray[depth];
        figurePoint.type = type;
    }
}

- (void)buildFigurePointArray {
    //1. 找到最高点
    //2. 找到最低点
    PointEntity *firstPointEntity = self.pointArray.firstObject;
    CGFloat max = firstPointEntity.max;
    CGFloat min = firstPointEntity.min;
    for (int i = 0; i< self.pointArray.count; i++) {
        PointEntity *point = self.pointArray[i];
        if(point.min<min){
            min = point.min;
        }
        if(point.max > max){
            max = point.max;
        }
    }
    int maxzheng = max / self.gezhi;
    int minzheng = min / self.gezhi;
    
    for (int i = 0; i<= maxzheng - minzheng; i++) {
        NSMutableArray *oneLineArray = [[NSMutableArray alloc]init];
        for (int j = 0;j< self.pointArray.count; j++) {
            FigurePoint *figurePoint = [[FigurePoint alloc]init];
            figurePoint.type = -1;
            [oneLineArray addObject:figurePoint];
        }
        [self.figurePointArray addObject:oneLineArray];
    }
    self.minAll = min;
    self.maxAll = max;
    NSLog(@"最大值:%f",self.minAll);
    NSLog(@"最小值:%f",self.maxAll);
}

- (NSMutableArray *)pointArray {
    if(!_pointArray){
        _pointArray = [[NSMutableArray alloc]init];
        PointEntity *entity1 = [[PointEntity alloc]init];
        entity1.begin = 3314.03;
        entity1.max = 3402.07;
        entity1.min = 3314.03;
        entity1.end = 3391.75;
        
        PointEntity *entity2 = [[PointEntity alloc]init];
        entity2.begin = 3391.55;
        entity2.max = 3435.42;
        entity2.min = 3384.56;
        entity2.end = 3428.86;
        
        PointEntity *entity3 = [[PointEntity alloc]init];
        entity3.begin = 3428.95;
        entity3.max = 3498;
        entity3.min = 3401.03;
        entity3.end = 3487.75;
        
        PointEntity *entity4 = [[PointEntity alloc]init];
        entity4.begin = 3476.03;
        entity4.max = 3574.07;
        entity4.min = 3475.03;
        entity4.end = 3558.75;
        
        PointEntity *entity5 = [[PointEntity alloc]init];
        entity5.begin = 3563.03;
        entity5.max = 3587.07;
        entity5.min = 3388.03;
        entity5.end = 3462.75;
        
        PointEntity *entity6 = [[PointEntity alloc]init];
        entity6.begin = 3411.03;
        entity6.max = 3487.07;
        entity6.min = 3062.03;
        entity6.end = 3129.75;
        
        PointEntity *entity7 = [[PointEntity alloc]init];
        entity7.begin = 3128.03;
        entity7.max = 3219.07;
        entity7.min = 3113.03;
        entity7.end = 3199.75;
        
        PointEntity *entity8 = [[PointEntity alloc]init];
        entity8.begin = 3237.03;
        entity8.max = 3294.07;
        entity8.min = 3234.03;
        entity8.end = 3289.75;
        
        PointEntity *entity9 = [[PointEntity alloc]init];
        entity9.begin = 3307.03;
        entity9.max = 3335.07;
        entity9.min = 3228.03;
        entity9.end = 3254.75;
        
        PointEntity *entity10 = [[PointEntity alloc]init];
        entity10.begin = 3255.03;
        entity10.max = 3309.07;
        entity10.min = 3236.03;
        entity10.end = 3307.75;
        
        PointEntity *entity11 = [[PointEntity alloc]init];
        entity11.begin = 3319.03;
        entity11.max = 3333.07;
        entity11.min = 3269.03;
        entity11.end = 3269.75;
        
        PointEntity *entity12 = [[PointEntity alloc]init];
        entity12.begin = 3264.03;
        entity12.max = 3314.07;
        entity12.min = 3110.03;
        entity12.end = 3152.75;
        
        PointEntity *entity13 = [[PointEntity alloc]init];
        entity13.begin = 3117.03;
        entity13.max = 3177.07;
        entity13.min = 3091.03;
        entity13.end = 3168.75;
        
        PointEntity *entity14 = [[PointEntity alloc]init];
        entity14.begin = 3169.03;
        entity14.max = 3192.07;
        entity14.min = 3119.03;
        entity14.end = 3131.75;
        
        PointEntity *entity15 = [[PointEntity alloc]init];
        entity15.begin = 3125.03;
        entity15.max = 3220.07;
        entity15.min = 3110.03;
        entity15.end = 3159.75;
        
        PointEntity *entity16 = [[PointEntity alloc]init];
        entity16.begin = 3152.03;
        entity16.max = 3153.07;
        entity16.min = 3014.03;
        entity16.end = 3071.75;
        
        PointEntity *entity17 = [[PointEntity alloc]init];
        entity17.begin = 3063.03;
        entity17.max = 3136.07;
        entity17.min = 3045.03;
        entity17.end = 3089.75;
        [_pointArray addObject:entity1];
        [_pointArray addObject:entity2];
        [_pointArray addObject:entity3];
        [_pointArray addObject:entity4];
        [_pointArray addObject:entity5];
        [_pointArray addObject:entity6];
        [_pointArray addObject:entity7];
        [_pointArray addObject:entity8];
        [_pointArray addObject:entity9];
        [_pointArray addObject:entity10];
        [_pointArray addObject:entity11];
        [_pointArray addObject:entity12];
        [_pointArray addObject:entity13];
        [_pointArray addObject:entity14];
        [_pointArray addObject:entity15];
        [_pointArray addObject:entity16];
        [_pointArray addObject:entity17];
    }
    return _pointArray;
}

@end
