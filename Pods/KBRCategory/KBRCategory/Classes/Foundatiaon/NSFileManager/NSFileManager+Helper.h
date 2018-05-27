//
//  NSFileManager+Helper.h
//  RapidCalculation
//
//  Created by Huan WANG on 19/06/2017.
//  Copyright © 2017 knowin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Helper)

- (NSError *)ensureParentDirForPath:(NSString *)path;

- (BOOL)removeFile:(NSString *)path;

- (BOOL)removeFile:(NSString *)path error:(NSError **)errorRef;

- (BOOL)renameFileFromPath:(NSString *)source
					toPath:(NSString *)dest;

- (NSString *)documentPath;

- (NSString *)cachesPath;

+ (NSString *)MD5FromFile:(NSString *)filePath;

+ (NSString *)kb_lottieResouceWith:(NSString *)aFileName inDirectory:(NSString *)aDirectory;

@end
