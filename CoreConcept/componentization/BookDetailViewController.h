//
//  BookDetailViewController.h
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ComponentProtocol.h"

@interface BookDetailViewController : UIViewController<BookDetailComponentProtocol>

- (instancetype)initWithBookId:(NSString *)bookId;

@end
