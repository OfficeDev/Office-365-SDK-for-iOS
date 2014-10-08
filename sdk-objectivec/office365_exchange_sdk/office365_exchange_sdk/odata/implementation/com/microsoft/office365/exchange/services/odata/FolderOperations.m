/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "FolderOperations.h"

@implementation FolderOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    return [super initOperationWith:urlComponent :parent];
}

-(NSURLSessionDataTask*)copy : (NSString *) DestinationId : (void (^)(Folder *folder, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Copy" :nil :POST :^(Response *r,NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:[r getData] encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : [Folder class] : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)move : (NSString *) DestinationId : (void (^)(Folder *folder, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Move" :nil :POST :^(Response *r, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:[r getData] encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : [Folder class] : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end