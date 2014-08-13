//
//  FileClient.h
//  office365-files-sdk
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <office365-base-sdk/BaseClient.h>
#import "FileEntity.h"

@interface FileClient : BaseClient

- (NSURLSessionDataTask *)createFolder:(NSString *)name parentFolder:(NSString *)parentFolder callback:(void (^)(FileEntity *folder, NSError *))callback;

- (NSURLSessionDataTask *)getFileById:(NSString *)fId callback :(void (^)(FileEntity *file, NSError *error))callback;

- (NSURLSessionDataTask *)getFiles:(void (^)(NSMutableArray *files, NSError *error))callback;

- (NSURLSessionDataTask *)getFiles:(NSString *)folder callback:(void (^)(NSMutableArray *files, NSError *error))callback;

- (NSURLSessionDataTask *)createFile:(NSString *)name overwrite:(BOOL)overwrite body:(NSData *)body folder:(NSString *)folder : (void (^)(FileEntity *file, NSError *error))callback;

- (NSURLSessionDataTask *)delete:(NSString *)name callback:(void (^)(NSString *status, NSError *error))callback;

- (NSURLSessionDataTask *)copy:(NSString *)name destinationFolder:(NSString *)destinationFolder callback:(void (^)(NSString * status, NSError * error))callback;

- (NSURLSessionDataTask *)move:(NSString *)name destinationFolder:(NSString *)destinationFolder callback:(void (^)(NSString *responseCode, NSError *error))callback;
/*
- (NSURLSessionDataTask *)getFiles:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)getFiles:(NSString *)folder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)createEmptyFile:(NSString *)name folder:(NSString *)folder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)createFile:(NSString *)name overwrite:(BOOL)overwrite body:(NSData *)body folder:(NSString *)folder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)createFolder:(NSString *)name parentFolder:(NSString *)parentFolder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDownloadTask *)download:(NSString *)name delegate:(id <NSURLSessionDelegate>)delegate;
- (NSURLSessionDataTask *)delete:(NSString *)name callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)copy:(NSString *)name destinationFolder:(NSString *)destinationFolder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)move:(NSString *)name destinationFolder:(NSString *)destinationFolder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
*/
//- (instancetype)initWithUrl:(NSString *)url credentials:(Credentials *)credentials;

@end