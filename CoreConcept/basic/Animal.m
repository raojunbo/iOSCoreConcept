//
//  Animal.m
//  CoreConcept
//
//  Created by rjb on 2018/6/27.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Animal.h"

@implementation Animal
+ (void)load {
    
    NSLog(@"%s",__FUNCTION__);
}

+(void)initialize {
     NSLog(@"%s",__FUNCTION__);
}
@end
