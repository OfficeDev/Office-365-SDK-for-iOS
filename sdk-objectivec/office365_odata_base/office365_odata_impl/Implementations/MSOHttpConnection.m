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
        
        long statusCode = [(NSHTTPURLResponse*)response statusCode];
        
        if(statusCode < 200 || statusCode > 299){
            if(error == nil){
                NSArray * msj = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
                error = [[NSError alloc] initWithDomain:@"Error in the Request" code:statusCode userInfo:(NSDictionary*)msj];
            }
            
            callback([[MSOResponseImpl alloc] initWith:nil :statusCode], error);
        }else{
            MSOResponseImpl* responseImpl = [[MSOResponseImpl alloc] initWith:data :statusCode];
            callback(responseImpl, error);
        }
    }];
    
    return task;
}

-(id<MSORequest>)createRequest{
    return [[MSORequestImpl alloc] init];
}

@end
