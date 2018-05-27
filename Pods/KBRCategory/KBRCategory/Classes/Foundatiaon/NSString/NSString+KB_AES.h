//
//  NSString+KB_AES.h
//  pay
//
//  Created by rjb on 16/5/5.
//  Copyright © 2016年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KB_AES)
    
- (NSString *) kb_AES256_Encrypt:(NSString *)key withIv:(NSString *)iv;
- (NSString *) kb_AES256_Decrypt:(NSString *)key withIv:(NSString *)iv;

@end
