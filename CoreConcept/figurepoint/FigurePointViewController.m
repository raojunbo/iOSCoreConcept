//
//  FigurePointViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/5/31.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "FigurePointViewController.h"

@interface PointEntity : NSObject
@property (nonatomic, strong) NSString *time;
@property (nonatomic, assign)CGFloat begin;
@property (nonatomic, assign) CGFloat max;
@property (nonatomic, assign) CGFloat min;
@property (nonatomic, assign) CGFloat end;
@end
@implementation PointEntity
@end

@interface FigurePointEntity:NSObject
@property (nonatomic, assign) int value;//格值
@property (nonatomic, assign) int type;//type = 0; type = 1是x
@property (nonatomic, assign) int depth;//向右的深度
@end
@implementation FigurePointEntity

@end

@interface FigurePointViewController ()
@property (nonatomic, strong) NSMutableArray *pointArray;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSMutableArray *> *valueDict;// key为众坐标;
@property (nonatomic, assign) int gezhi;
@end

@implementation FigurePointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.gezhi = 50;
    
    int type = 1;//0表示o,1表示x
    int depth = 0;//向右的深度
    int lastColumnMax = 0;//上列的最大值
    int lastColumnMin = 0;//上列的最小值
    
    for (int i = 0; i< 6; i++) {
        PointEntity *currentEntity = self.pointArray[i];
        if (i == 0) {
            [self checkPointMergeUp:currentEntity depth:depth type:type];
            type = 1;
            lastColumnMax = currentEntity.max;
            lastColumnMin = currentEntity.min;
        }else{
            //当前是上涨列；
            if(type == 1){
                 //查看当前数据的最高价是否可以追加上涨；
                BOOL newHigh =  [self checkNewHigh:currentEntity lastColumMax:lastColumnMax depth:depth];
                if(newHigh){
                    [self checkPointMergeUp:currentEntity depth:depth type:type];
                    lastColumnMax = currentEntity.max;
                }else if([self checkUpToDown:currentEntity withLastColumnMax:lastColumnMax]){
                    //没有形成新的高价时。最低价是否比最高价小于一级
                    depth = depth + 1;
                    type = 0;
                    CGFloat cigao = lastColumnMax - self.gezhi;
                    [self checkPoint:currentEntity ciGao:cigao depth:depth type:type];
                }else{
                    //什么也不做
                }
            }else{
                //当前列是下降
                BOOL newLow = [self checkNewLow:currentEntity lastColumMin:lastColumnMin depth:depth];
                if(newLow){
                    [self checkPointMergeUp:currentEntity depth:depth type:type];
                    lastColumnMin = currentEntity.min;
                }else if([self checkDowToUp:currentEntity withLastColumnMin:lastColumnMin]){
                    depth = depth + 1;
                    type = 1;
                    CGFloat cidi = lastColumnMin + self.gezhi;
                    [self checkPoint:currentEntity ciDi:cidi depth:depth type:type];
                }else {
                    //什么也不做
                }
            }
        }
    }
     [self printFigurePoint];
}

- (BOOL)checkDowToUp:(PointEntity *)currentEntity withLastColumnMin:(CGFloat)lastColumnMin {
    int minchu = currentEntity.min/self.gezhi;
    CGFloat lastColumnCiDi =  lastColumnMin + self.gezhi;
    int minChuCiDi = lastColumnCiDi/self.gezhi;
    if(currentEntity.min > minChuCiDi){
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)checkUpToDown:(PointEntity *)currentEntity withLastColumnMax:(CGFloat)lastColumnMax {
    int minchu = currentEntity.min/self.gezhi;
    CGFloat lastColumnCiGao =  lastColumnMax - self.gezhi;
    int minChuCiGao = lastColumnCiGao/self.gezhi;
    if(currentEntity.min < lastColumnCiGao){
        return YES;
    }else{
        return NO;
    }
}

#pragma 检测是否有新高的格 或者新低的格
- (BOOL)checkNewLow:(PointEntity *)currentEntity lastColumMin:(CGFloat)lastColumMin depth:(int)depth {
    int minchu = currentEntity.min/self.gezhi;
    int minzheng = self.gezhi *minchu;
    
    int lastColumMinChu =lastColumMin/self.gezhi;
    int lastColumMinZheng = self.gezhi *lastColumMinChu;
    if(minzheng < lastColumMinZheng){
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)checkNewHigh:(PointEntity *)currentEntity lastColumMax:(CGFloat)lastColumMax depth:(int)depth {
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
#pragma --end

#pragma --合并向上 或者向下
- (void)checkPointMergeUp:(PointEntity *)currentEntity depth:(int)depth type:(int)type{
    //需要就depth做合并渲染
    int minchu = currentEntity.min/self.gezhi;
    int minzheng = self.gezhi * minchu;

    int maxchu = currentEntity.max/self.gezhi;
    int maxzheng = self.gezhi *maxchu;
    [self checkPoinWithMinZheng:minzheng maxZheng:maxzheng depth:depth type:type];
}

- (void)checkPoint:(PointEntity *)currentEntity ciGao:(CGFloat)ciGao depth:(int)depth type:(int)type {
    int minchu = currentEntity.min/self.gezhi;
    int minzheng = self.gezhi * minchu;
    [self checkPoinWithMinZheng:minzheng maxZheng:ciGao depth:depth type:type];
}

- (void)checkPoint:(PointEntity *)currentEntity ciDi:(CGFloat)ciDi depth:(int)depth type:(int)type {
    int maxchu = currentEntity.max/self.gezhi;
    int maxzheng = self.gezhi * maxchu;
    
    [self checkPoinWithMinZheng:ciDi maxZheng:maxzheng depth:depth type:type];
}

- (void)checkPoinWithMinZheng:(int)minzheng maxZheng:(int)maxzheng depth:(int)depth type:(int)type {
    int beginWhile = minzheng + 50;
    while (beginWhile<=maxzheng) {
        FigurePointEntity *entity = [[FigurePointEntity alloc]init];
        entity.value = beginWhile;
        entity.type = type;
        entity.depth = depth;
        NSString *valueKey = [NSString stringWithFormat:@"%@",@(entity.value)];
        NSMutableArray *valueArray = [self.valueDict objectForKey:valueKey];
        if(valueArray == nil){
            //key值为空。肯定不存在
            valueArray = [[NSMutableArray alloc]init];
            [self.valueDict setObject:valueArray forKey:valueKey];
            [valueArray addObject:entity];
        }else{
            //检测是否已经存在
            BOOL cunzai = NO;
            for (int i = 0; i< valueArray.count; i++) {
                FigurePointEntity *figurePointEntity = valueArray[i];
                if (figurePointEntity.depth == depth) {
                    //已经存在
                    cunzai = YES;
                    break;
                }
            }
            if(!cunzai){
                [valueArray addObject:entity];
            }
        }
        beginWhile = beginWhile + self.gezhi;
    }
}

- (void)printFigurePoint {
    NSArray *allKeys = self.valueDict.allKeys;
    NSArray *sortedArray = [allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString  * obj1, NSString *  _Nonnull obj2) {
        if([obj1 intValue] < [obj2 intValue]){
            return NSOrderedDescending ;
        }else{
            return NSOrderedAscending;
        }
    }];
    
    //将数据打印出来
    [sortedArray enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        //每一行,是一个数组
        NSArray *valueArray = [self.valueDict objectForKey:key];
        FigurePointEntity *figurePointEntity = valueArray.lastObject;//最后一个肯定是最深的
        int maxIndex = figurePointEntity.depth;//最大深度
        for (int i = 0; i<=maxIndex; i++) {
            //找当前列，是否存在
            BOOL cunzai = NO;
            for (int j = 0; j< valueArray.count; j++) {
                FigurePointEntity *figurePointEntity = valueArray[j];
                if(figurePointEntity.depth == i){
                    cunzai = YES;
                    break;
                }
            }
            if (i == 0) {
                printf("%s",[key UTF8String]);
            }
            if(cunzai){
                NSString *valueStr = @"o";
                if(figurePointEntity.type == 1){
                    valueStr= @"x";
                }
                printf("%s", [valueStr UTF8String]);
            }else{
                printf(" ");
            }
        }
        printf("\n");
    }];
}

- (NSMutableDictionary *)valueDict {
    if(!_valueDict){
        _valueDict = [[NSMutableDictionary alloc]init];
    }
    return _valueDict;
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
