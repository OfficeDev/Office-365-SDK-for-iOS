//
//  HttpConection.h
//  office365-base-sdk
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

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