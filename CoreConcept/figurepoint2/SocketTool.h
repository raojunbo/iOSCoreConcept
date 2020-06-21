//
//  SocketTool.h
//  CoreConcept
//
//  Created by rjb on 2020/6/21.
//  Copyright © 2020 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLineModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SocketKLineResponse : NSObject
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *ts;
@property (nonatomic, strong) NSArray <KLineModel *> *data;
@property (nonatomic, strong) NSString *rep;
@end

typedef void (^SocketResponseBlock)(SocketKLineResponse *);

@interface SocketTool : NSObject
@property (nonatomic, assign) BOOL isOpening;
+ (instancetype)tool;

- (void)open;


- (void)send:(NSDictionary *)messageDict responseBlock:(SocketResponseBlock)responseBlock;

@end

NS_ASSUME_NONNULL_END
