/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Credentials.h"

@interface HttpConnection : NSObject

@property (nonatomic) NSMutableURLRequest *request;
@property (nonatomic) Credentials *credentials;

- (instancetype)initWithCredentials:(Credentials *)credentials url:(NSString *)url;
- (instancetype)initWithCredentials:(Credentials *)credentials url:(NSString *)url body:(NSString *)body;
- (instancetype)initWithCredentials:(Credentials *)credentials url:(NSString *)url bodyArray:(NSData *)bodyArray;
- (NSURLSessionDataTask *)execute:(NSString *)method callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
- (NSURLSessionDownloadTask*) download: (NSString*) method delegate:(id <NSURLSessionDelegate>)delegate;

@end