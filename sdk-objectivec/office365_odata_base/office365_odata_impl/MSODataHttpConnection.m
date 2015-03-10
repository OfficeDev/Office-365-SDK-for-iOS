/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataHttpConnection.h"
#import "MSODataRequestImpl.h"
#import "MSODataResponseImpl.h"
#import "MSODataException.h"

@interface MSODataHttpConnection() <NSURLSessionDataDelegate>

@property NSMutableURLRequest *request;
@property (strong)NSInputStream *inputStream;
@property NSMutableData *responseData;

@end

@implementation MSODataHttpConnection

-(NSURLSessionTask *)execute:(id<MSODataRequest>)request :(void (^)(id<MSODataResponse> response, MSODataException *error))callback{
    
    if([[request getOptions] count]>0){
        return [self executeWithRequest:request :callback];
    }
    
    NSString* option = [[[request getOptions] objectAtIndex:0] key];
    
    if([option isEqualToString:@"MUST_STREAM_RESPONSE_CONTENT"]){
        return [self executeWithDelegate:request :callback];
    }
    
    return [self downloadStream :request :callback];
}

-(NSURLSessionTask *)executeWithRequest:(id<MSODataRequest>)request :(void (^)(id<MSODataResponse> response, MSODataException *error))callback{
    
    [self prepareRequest:request];
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: conf delegate:self
                                                     delegateQueue:  [NSOperationQueue currentQueue]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:_request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [self handleResponse:data :response :error :callback];
    }];
    
    return task;
}

-(NSURLSessionTask *)downloadStream :(id<MSODataRequest>)request :(void (^)(id<MSODataResponse> response, MSODataException *error))callback{
    
    [self prepareRequest:request];
    
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: conf delegate:self
                                                     delegateQueue:  [NSOperationQueue currentQueue]];
    
    NSURLSessionDownloadTask * task = [session downloadTaskWithRequest:_request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        
        [self handleResponse:self.responseData :response :error :callback];
    }];
    
    return task;
}

-(NSURLSessionTask *)executeWithDelegate :(id<MSODataRequest>)request :(void (^)(id<MSODataResponse> response, MSODataException *error))callback{
    
    [self prepareRequest:request];
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: conf delegate:self
                                                     delegateQueue:  [NSOperationQueue currentQueue]];
    
    __block NSURLSessionUploadTask * task = [session uploadTaskWithStreamedRequest:_request];

    dispatch_queue_t tasks = dispatch_queue_create("tasks", NULL);
    
    dispatch_async(tasks, ^{
        
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        dispatch_semaphore_signal(sem);
        
        while ([task state] != NSURLSessionTaskStateCompleted) {
            
            dispatch_semaphore_wait(sem, 0.1);
        }
        
        [self handleResponse:nil : task.response : task.error :callback];
        
    });
    
    return task;
}

-(id<MSODataRequest>)createRequest{
    return [[MSODataRequestImpl alloc] init];
}

-(void)prepareRequest :(id<MSODataRequest>)request {
    
    _request =  [(MSODataRequestImpl*)request getMutableRequest];
    
    MSODataRequestImpl* reqImpl = (MSODataRequestImpl*) request;
    
    [_request setURL:[[NSURL alloc] initWithString:[[reqImpl getUrl] toString]]];
    
    _request.HTTPMethod = [reqImpl verbToString:[reqImpl getVerb]];
 
    if([reqImpl getStreamedContent] != nil){
        _request.HTTPBodyStream = [reqImpl getStreamedContent];
    }
    else if ([reqImpl getContent] != nil){
        _request.HTTPBody = [reqImpl getContent];
    }
    
    NSLog(@"VERB: %@, URL: %@, HEADERS/Keys: %@, HEADERS/Values: %@",
          [reqImpl verbToString:[reqImpl getVerb]], [[request getUrl] toString],
          [[request getHeaders] allKeys], [[request getHeaders] allValues]);
}

-(void)handleResponse : (NSData*) data :(NSURLResponse*)response : (NSError*)error : (void (^)(id<MSODataResponse> response, MSODataException *error)) callback{

    long statusCode = [(NSHTTPURLResponse*)response statusCode];
    
    if(statusCode < 200 || statusCode > 299){
        if(error == nil){
            NSArray * msj = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
            error = [[NSError alloc] initWithDomain:@"Error in the Request" code:statusCode userInfo:(NSDictionary*)msj];
        }
        MSODataResponseImpl* res = [[MSODataResponseImpl alloc] initWithPayload:data :response];
        
        callback(res, [[MSODataException alloc] initWithResponse:res andError:error]);
    }else{
        MSODataResponseImpl* responseImpl = [[MSODataResponseImpl alloc] initWithPayload:data : response];
        callback(responseImpl, nil);
    }
}


#pragma mark - NSURLSessionDataDelegate

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
    NSLog(@"%lld %lld %lld", bytesSent, totalBytesSent, totalBytesExpectedToSend);
}


- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task needNewBodyStream:(void (^)(NSInputStream *bodyStream))completionHandler
{
    completionHandler(self.inputStream);
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"%s: error = %@; data = %@", __PRETTY_FUNCTION__, error, [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
}

#pragma mark - NSURLSessionDataDelegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
    self.responseData = [NSMutableData data];
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

@end