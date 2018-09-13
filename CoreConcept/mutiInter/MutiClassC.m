//
//  MutiClassC.m
//  CoreConcept
//
//  Created by rjb on 2018/9/6.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "MutiClassC.h"
#import "MutiClassA.h"
#import "MutiClasssB.h"

//这是采用组合的形式实现多继承
@interface MutiClassC()
@property (nonatomic, strong)MutiClassA *classA;
@property (nonatomic, strong)MutiClasssB *calssB;
@end

@implementation MutiClassC

@end
