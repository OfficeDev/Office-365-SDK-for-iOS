/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOHttpConnection.h"
#import "MSORequestImpl.h"
#import "MSOResponseImpl.h"

@implementation MSOHttpConnection

-(NSURLSessionDataTask *)execute:(id<MSORequest>)request :(void (^)(id<MSOResponse> response, NSError *error))callback{
    
    NSMutableURLRequest* r = [(MSORequestImpl*)request getMutableRequest] ;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:r completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        MSOResponseImpl* responseImpl = [[MSOResponseImpl alloc] initWith:data :0];
        callback(responseImpl, error);
    }];
    
    return task;
}

-(id<MSORequest>)createRequest{
    return [[MSORequestImpl alloc] init];
}

@end
