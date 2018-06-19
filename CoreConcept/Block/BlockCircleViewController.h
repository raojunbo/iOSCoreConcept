//
//  BlockCircleViewController.h
//  CoreConcept
//
//  Created by rjb on 2018/5/28.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BlockCircleViewController : UIViewController
@property (nonatomic, strong)void(^backBlock)(void(^pa)(void));
@end
