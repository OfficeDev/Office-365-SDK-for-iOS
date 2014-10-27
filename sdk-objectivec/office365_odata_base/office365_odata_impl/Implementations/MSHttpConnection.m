/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSHttpConnection.h"
#import "MSRequestImpl.h"
#import "MSResponseImpl.h"

@implementation MSHttpConnection

-(NSURLSessionDataTask *)execute:(id<MSRequest>)request :(void (^)(id<MSResponse> response, NSError *error))callback{
    
    NSMutableURLRequest* r = [(MSRequestImpl*)request getMutableRequest] ;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:r completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        long statusCode = [(NSHTTPURLResponse*)response statusCode];
        
        if(statusCode < 200 || statusCode > 299){
            if(error == nil){
                NSArray * msj = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
                error = [[NSError alloc] initWithDomain:@"Error in the Request" code:statusCode userInfo:(NSDictionary*)msj];
            }
            
            callback([[MSResponseImpl alloc] initWith:nil :(int)statusCode], error);
        }else{
            MSResponseImpl* responseImpl = [[MSResponseImpl alloc] initWith:data :(int)statusCode];
            callback(responseImpl, error);
        }
    }];
    
    return task;
}

-(id<MSRequest>)createRequest{
    return [[MSRequestImpl alloc] init];
}

@end
