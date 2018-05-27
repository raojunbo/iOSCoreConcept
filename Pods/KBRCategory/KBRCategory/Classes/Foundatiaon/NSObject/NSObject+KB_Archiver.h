//
//  NSObject+KB_Archiver.h
//  RapidCalculation
//
//  Created by lihui on 2018/1/23.
//  Copyright © 2018年 knowin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KB_Archiver)

// Archiver
- (void)kb_coderWithCoder:( NSCoder * _Nullable )aCoder Class:(nullable Class)aClass;
// unArchiver
- (void)kb_decoderWithCoder:( NSCoder * _Nullable )aDecoder Class:(nullable Class)aClass;

@end
