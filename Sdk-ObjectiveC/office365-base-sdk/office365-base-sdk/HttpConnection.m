//
//  HttpConection.m
//  office365-base-sdk
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "HttpConnection.h"

@implementation HttpConnection : NSObject

- (instancetype)initWithCredentials:(Credentials *)credentials url:(NSString *)url{
    self = [super init];
    
    self.credentials = credentials;
    self.request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:url]];
    
    [self createRequest];
    
    return self;
}

- (instancetype)initWithCredentials:(Credentials *)credentials url:(NSString *)url body:(NSString *)body{
    return self;
}

- (instancetype)initWithCredentials:(Credentials *)credentials url:(NSString *)url bodyArray:(NSData *)bodyArray{
    self = [super init];
    
    self.credentials = credentials;
    self.request = [[NSMutableURLRequest alloc] initWithURL: [[NSURL alloc] initWithString:url]];
    self.request.HTTPBody = bodyArray;
    self.request.timeoutInterval = 60;
    
    NSString* length = [NSString stringWithFormat: @"%lu", (unsigned long)[bodyArray length]];
    
    [self.request addValue: @"application/json;odata.metadata=full" forHTTPHeaderField: @"Content-Type"];
    [self.request addValue: length forHTTPHeaderField: @"Content-Length"];
    [self createRequest];
    
    return self;
}

-(void)createRequest{
    
    [self.request addValue:@"application/json;odata=verbose" forHTTPHeaderField: @"Accept"];
    [self.request addValue:@"100-continue" forHTTPHeaderField: @"Expect"];
    [self.request addValue:@"application/json;odata.metadata=full" forHTTPHeaderField: @"Content-Type"];
    [self.request addValue:@"IOS-SDK" forHTTPHeaderField: @"X-ClientService-ClientTag"];
    [self.credentials prepareRequest:self.request];
}

- (NSURLSessionDataTask *)execute:(NSString *)method callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback{
    
    self.request.HTTPMethod = method;
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:self.request completionHandler:callback];
    
    return task;
}

-(NSURLSessionDownloadTask*) download: (NSString*) method delegate:(id <NSURLSessionDelegate>)delegate{
    
    self.request.HTTPMethod = method;
    
    NSURLSessionConfiguration* conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:conf delegate:delegate
                                                     delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask* task = [session downloadTaskWithRequest:self.request];
    
    return task;
}

/*
 init(credentials : Credentials, url : String, body : NSString){
 super.init();
 
 var contentBody = body.dataUsingEncoding(NSUTF8StringEncoding);
 self.credentials = credentials;
 self.request = NSMutableURLRequest(URL : NSURL(string : url));
 self.request.HTTPBody = contentBody;
 
 var length = NSString(format:"%d", contentBody.length);
 self.request.addValue("application/json;odata.metadata=full", forHTTPHeaderField: "Content-Type");
 self.request.addValue(length, forHTTPHeaderField: "Content-Length");
 
 self.createRequest();
 }
 
 init(credentials : Credentials, url : String, bodyArray : NSData){
 super.init();
 
 self.credentials = credentials;
 self.request = NSMutableURLRequest(URL : NSURL(string : url));
 self.request.HTTPBody = bodyArray;
 self.request.timeoutInterval = 60;
 var length = NSString(format:"%d", bodyArray.length);
 self.request.addValue("application/json;odata.metadata=full", forHTTPHeaderField: "Content-Type");
 self.request.addValue(length, forHTTPHeaderField: "Content-Length");
 self.createRequest();
 }
 */
@end