//
//  FileDiscoveryClient.h
//  office365-base-sdk
//
//  Created by Gustavo on 7/21/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "BaseClient.h"

@interface FileDiscoveryClient : BaseClient

- (NSURLSessionDataTask *)getDiscoveryInfo:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback;
- (NSMutableArray *)parseData:(NSData *)data;
- (instancetype)initWithUrl:(NSString *)url credentials:(Credentials *)credentials;

@end