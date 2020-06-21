//
//  PointFigureDataManager.h
//  FigurePoint
//
//  Created by rjb on 2020/6/2.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLineModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FigurePoint : NSObject
@property (nonatomic, assign) int type;//类型0 或则1
@property (nonatomic, assign) int depth;
@end

@interface PointFigureDataProcesser : NSObject
@property (nonatomic, strong) NSDecimalNumber *gezhiDecimal;
@property (nonatomic,strong)NSArray<KLineModel *> *pointArray;
@property (nonatomic, strong)NSMutableArray<NSMutableArray<FigurePoint *> *> *figurePointArray;
@property (nonatomic, strong) NSDecimalNumber *minAllDecimal;
@property (nonatomic, strong) NSDecimalNumber *maxAllDecimal;

@end

NS_ASSUME_NONNULL_END
