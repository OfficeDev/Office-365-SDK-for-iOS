//
//  HttpConnection.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "HttpConnection.h"
#import "RequestImpl.h"

@implementation HttpConnection


- (NSURLSessionDataTask *)execute:(Request *)request callback:(void (^)(NSData *data, NSURLResponse *response, NSError *error))callback{
    
    [request addHeader:@"Office365-SDK" : @"User-Agent"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:[(RequestImpl*)request getMutableRequest] completionHandler:callback];
    
    return task;
}

@end
