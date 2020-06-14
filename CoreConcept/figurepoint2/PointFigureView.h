//
//  PointFigureView.h
//  FigurePoint
//
//  Created by rjb on 2020/6/2.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PointFigureDataProcesser.h"
NS_ASSUME_NONNULL_BEGIN

@interface PointFigureView : UIView
@property(nonatomic, strong) PointFigureDataProcesser *processer;
@end

NS_ASSUME_NONNULL_END
