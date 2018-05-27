//
//  NSData+AES.h
//  pay
//
//  Created by rjb on 16/5/5.
//  Copyright © 2016年 rjb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (KB_AES)
//加密
- (NSData *) kb_AES256_Encrypt:(NSString *)key withIv:(NSString *)iv;
//解密
- (NSData *) kb_AES256_Decrypt:(NSString *)key withIv:(NSString *)iv;

@end
