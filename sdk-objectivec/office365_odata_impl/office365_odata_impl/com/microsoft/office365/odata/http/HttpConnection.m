//
//  HttpConnection.m
//  office365_odata_impl
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "HttpConnection.h"
#import "RequestImpl.h"
#import "ResponseImpl.h"

@implementation HttpConnection

-(NSURLSessionDataTask *)execute:(Request *)request :(void (^)(Response * r, NSError *e))callback{
    
    NSMutableURLRequest* r = [(RequestImpl*)request getMutableRequest] ;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:r completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        ResponseImpl* responseImpl = [[ResponseImpl alloc] initWith:data :0];
        callback(responseImpl, error);
    }];
    
    return task;
}

-(Request *)createRequest{
    return [[RequestImpl alloc] init];
}

@end
