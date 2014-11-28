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

@implementation MSODataHttpConnection

-(NSURLSessionDataTask *)execute:(id<MSODataRequest>)request :(void (^)(id<MSODataResponse> response, MSODataException *error))callback{
    
    NSMutableURLRequest* r =  [(MSODataRequestImpl*)request getMutableRequest] ;
    MSODataRequestImpl* reqImpl = (MSODataRequestImpl*) request;
    
    
    [r setURL:[[NSURL alloc] initWithString:[[reqImpl getUrl] toString]]];
    //[request setVerb:[reqImpl getVerb]];
    r.HTTPMethod = [reqImpl verbToString:[reqImpl getVerb]];
    r.HTTPBody = [reqImpl getContent];
    
    //[request addHeader:@"Content-Type" :@"application/json"];
    //[request addHeader:@"User-Agent" :[self.Resolver getPlatformUserAgent:[self class]];
    //[request addHeader:@"X-ClientService-ClientTag" :[self.Resolver getPlatformUserAgent:productName]];
    
    NSLog(@"VERB: %@, URL: %@, HEADERS/Keys: %@, HEADERS/Values: %@", [reqImpl verbToString:[reqImpl getVerb]], [[request getUrl] toString], [[request getHeaders] allKeys], [[request getHeaders] allValues]);
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:r completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
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
    }];
    
    return task;
}

-(id<MSODataRequest>)createRequest{
    return [[MSODataRequestImpl alloc] init];
}

@end
