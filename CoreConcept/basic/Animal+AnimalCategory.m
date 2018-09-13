//
//  Animal+AnimalCategory.m
//  CoreConcept
//
//  Created by rjb on 2018/6/27.
//  Copyright © 2018年 rjb. All rights reserved.
//

#import "Animal+AnimalCategory.h"

@implementation Animal (AnimalCategory)

+ (void)load {
    
    NSLog(@"%s",__FUNCTION__);
}

- (void)animalJiao {
    NSLog(@"animaljiao");
}

@end
