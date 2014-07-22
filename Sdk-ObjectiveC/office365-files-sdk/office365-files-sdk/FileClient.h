//
//  FileClient.h
//  office365-files-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <office365-base-sdk/BaseClient.h>

@interface FileClient : BaseClient

- (NSURLSessionDataTask *)getFiles:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)getFiles:(NSString *)folder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)createEmptyFile:(NSString *)name folder:(NSString *)folder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)createFile:(NSString *)name overwrite:(BOOL)overwrite body:(NSData *)body folder:(NSString *)folder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)createFolder:(NSString *)name parentFolder:(NSString *)parentFolder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDownloadTask *)download:(NSString *)name delegate:(id <NSURLSessionDelegate>)delegate;
- (NSURLSessionDataTask *)delete:(NSString *)name callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)copy:(NSString *)name destinationFolder:(NSString *)destinationFolder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDataTask *)move:(NSString *)name destinationFolder:(NSString *)destinationFolder callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSMutableArray *)parseData:(NSData *)data;

//- (instancetype)initWithUrl:(NSString *)url credentials:(Credentials *)credentials;

@end