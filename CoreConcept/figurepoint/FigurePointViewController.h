//
//  FigurePointViewController.h
//  CoreConcept
//
//  Created by rjb on 2020/5/31.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface PointEntity : NSObject
@property (nonatomic, strong) NSString *time;
@property (nonatomic, assign)CGFloat begin;
@property (nonatomic, assign) CGFloat max;
@property (nonatomic, assign) CGFloat min;
@property (nonatomic, assign) CGFloat end;
@end
@interface FigurePointViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
