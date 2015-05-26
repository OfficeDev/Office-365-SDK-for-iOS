/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseClient.h"

@interface FileDiscoveryClient : BaseClient

- (NSURLSessionDataTask *)getDiscoveryInfo:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;
- (NSMutableArray *)parseData:(NSData *)data;
- (instancetype)initWithUrl:(NSString *)url credentials:(Credentials *)credentials;

@end