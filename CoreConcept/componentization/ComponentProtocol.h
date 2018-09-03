//
//  ComponentProtocol.h
//  CoreConcept
//
//  Created by rjb on 2018/9/3.
//  Copyright © 2018年 rjb. All rights reserved.
//

#ifndef ComponentProtocol_h
#define ComponentProtocol_h

#import <UIKit/UIKit.h>

@protocol BookDetailComponentProtocol<NSObject>

- (UIViewController *)bookDetailViewController:(NSString *)bookId;

@end

@protocol ReviewComponentProtocol<NSObject>

- (UIViewController *)reviewController:(NSString *)bookId;

@end


#endif /* ComponentProtocol_h */
