/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataHttpConnection.h"
#import "MSODataRequestImpl.h"
#import "MSODataResponseImpl.h"

@implementation MSODataHttpConnection

-(NSURLSessionDataTask *)execute:(id<MSODataRequest>)request :(void (^)(id<MSODataResponse> response, NSError *error))callback{
    
    NSMutableURLRequest* r =  [(MSODataRequestImpl*)request getMutableRequest] ;
    MSODataRequestImpl* reqImpl = (MSODataRequestImpl*) request;
    
    
    [r setURL:[[NSURL alloc] initWithString:[[reqImpl getUrl] toString]]];
    //[request setVerb:[reqImpl getVerb]];
    r.HTTPMethod = [reqImpl verbToString:[reqImpl getVerb]];
    r.HTTPBody = [reqImpl getContent];
    
    // [request addHeader:@"Content-Type" :@"application/json"];
    
    //[request addHeader:@"User-Agent" :[self.Resolver getPlatformUserAgent:[self class]];
    //[request addHeader:@"X-ClientService-ClientTag" :[self.Resolver getPlatformUserAgent:productName]];
    
    NSLog(@"VERB: %@, URL: %@, HEADERS/Keys: %@, HEADERS/Values: %@", [reqImpl verbToString:[reqImpl getVerb]], [request getUrl], [[request getHeaders] allKeys], [[request getHeaders] allValues]);
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:r completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        long statusCode = [(NSHTTPURLResponse*)response statusCode];
        
        if(statusCode < 200 || statusCode > 299){
            if(error == nil){
                NSArray * msj = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
                error = [[NSError alloc] initWithDomain:@"Error in the Request" code:statusCode userInfo:(NSDictionary*)msj];
            }
            
            callback([[MSODataResponseImpl alloc] initWith:nil :(int)statusCode], error);
        }else{
            MSODataResponseImpl* responseImpl = [[MSODataResponseImpl alloc] initWith:data :(int)statusCode];
            callback(responseImpl, error);
        }
    }];
    
    return task;
}

-(id<MSODataRequest>)createRequest{
    return [[MSODataRequestImpl alloc] init];
}

@end
