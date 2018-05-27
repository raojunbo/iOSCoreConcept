//
//  NSFileManager+Helper.m
//  RapidCalculation
//
//  Created by Huan WANG on 19/06/2017.
//  Copyright © 2017 knowin. All rights reserved.
//

#import "NSFileManager+Helper.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSFileManager (Helper)

- (NSError *)ensureParentDirForPath:(NSString *)path
{
	NSError *error = nil;
	
	if (nil == path) {
		error = [[NSError alloc] initWithDomain:@"cn.knowbox"
										   code:2000
									   userInfo:@{
												  NSLocalizedDescriptionKey : @"path is nil"
												  }];
		return error;
	}
	
	NSString *dir = [path stringByDeletingLastPathComponent];
	
	if (![self fileExistsAtPath:dir]) {
		[self createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&error];
	}
	
	return error;
}

- (BOOL)removeFile:(NSString *)path
{
	BOOL fileExist =
	[[NSFileManager defaultManager] fileExistsAtPath:path];
	if (!fileExist) {
		return YES;
	}
	
	NSError *fileError = nil;
	BOOL result =
	[[NSFileManager defaultManager] removeItemAtPath:path
											   error:&fileError];
	if (fileError) {
		NSLog(@"[File Error] %@", fileError.localizedDescription);
	}
	return result;
}

- (BOOL)removeFile:(NSString *)path error:(NSError **)errorRef
{
	if (!path) {
		return NO;
	}
	
	BOOL fileExist =
	[[NSFileManager defaultManager] fileExistsAtPath:path];
	if (!fileExist) {
		return YES;
	}
	
	NSError *fileError = nil;
	BOOL result =
	[[NSFileManager defaultManager] removeItemAtPath:path
											   error:&fileError];
	if (fileError) {
		if (errorRef) {
			*errorRef = fileError;
		}
	}
	return result;
}

- (BOOL)renameFileFromPath:(NSString *)source
					toPath:(NSString *)dest
{
	NSError *fileError = nil;
	
	fileError =
	[[NSFileManager defaultManager] ensureParentDirForPath:dest];
	if (fileError) {
		NSLog(@"[File Error] %@", fileError.localizedDescription);
		return NO;
	}
	
	BOOL result =
	[[NSFileManager defaultManager] moveItemAtPath:source
											toPath:dest
											 error:&fileError];
	if (fileError) {
		NSLog(@"[File Error] %@", fileError.localizedDescription);
	}
	return result;
}

- (NSString *)documentPath
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
												NSUserDomainMask, YES)
			firstObject];
}

- (NSString *)cachesPath
{
	return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
												NSUserDomainMask, YES)
			firstObject];
}

+ (NSString *)MD5FromFile:(NSString *)filePath
{
	NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
	if( handle== nil ) {
		return nil;
	}
	CC_MD5_CTX md5;
	CC_MD5_Init(&md5);
	BOOL done = NO;
	while(!done)
	{
		NSData* fileData = [handle readDataOfLength: 256 ];
		CC_MD5_Update(&md5, [fileData bytes], (CC_LONG)[fileData length]);
		if( [fileData length] == 0 ) done = YES;
	}
	unsigned char digest[CC_MD5_DIGEST_LENGTH];
	CC_MD5_Final(digest, &md5);
	NSString* s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
				   digest[0], digest[1],
				   digest[2], digest[3],
				   digest[4], digest[5],
				   digest[6], digest[7],
				   digest[8], digest[9],
				   digest[10], digest[11],
				   digest[12], digest[13],
				   digest[14], digest[15]];
	
	return s;
}

+ (NSString *)kb_lottieResouceWith:(NSString *)aFileName inDirectory:(NSString *)aDirectory
{
    NSString *path = [[NSBundle mainBundle] pathForResource:aFileName ofType:@"json" inDirectory:aDirectory];
    
    return path;
}

@end
