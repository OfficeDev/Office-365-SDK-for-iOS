/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"

#define OPT_STREAM_DOWNLOAD @"MUST_STREAM_DOWNLOAD_CONTENT"
#define OPT_STREAM_UPLOAD @"MUST_STREAM_UPLOAD_CONTENT"

@interface MSODataMediaEntityFetcher : MSODataEntityFetcher

- (id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

- (NSURLSessionDataTask *)getContentWithCallback:(void (^)(NSData *content, MSODataException * error))callback;

- (NSURLSessionDataTask *)getStreamedContentWithCallback:(void (^)(NSInputStream *content, MSODataException *exception))callback;

- (NSURLSessionDataTask *)putContent:(NSData*)content
                            callback:(void (^)(NSInteger statusCode, MSODataException *exception))callback;

- (NSURLSessionDataTask *)putContent:(NSInputStream *)content
                            withSize:(NSInteger)size
                            callback:(void (^)(NSInteger statusCode, MSODataException *exception))callback;

@end