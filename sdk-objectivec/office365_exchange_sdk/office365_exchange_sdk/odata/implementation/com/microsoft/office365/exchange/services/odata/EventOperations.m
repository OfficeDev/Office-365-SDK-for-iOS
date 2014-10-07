/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "EventOperations.h"
//todo
#import "Event.h"

@implementation EventOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    return [super initWith:urlComponent :parent];
}

-(NSURLSessionDataTask*)accept : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Accept" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)decline : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Decline" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)tentativelyAccept : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"TentativelyAccept" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)instances : (NSDate *) StartDate : (NSDate *) EndDate : (void (^)(Event *event, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Instances" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : [Event class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end