/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MessageOperations.h"

@implementation MessageOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    return [super initWith:urlComponent :parent];
}

-(NSURLSessionDataTask*)copy : (NSString *) DestinationId : (void (^)(Message *message, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Copy" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : [Message class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)move : (NSString *) DestinationId : (void (^)(Message *message, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Move" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : [Message class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)createReply : (void (^)(Message *message, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"CreateReply" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : [Message class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)createReplyAll : (void (^)(Message *message, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"CreateReplyAll" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : [Message class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)createForward : (void (^)(Message *message, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"CreateForward" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString : [Message class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)reply : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Reply" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
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

-(NSURLSessionDataTask*)replyAll : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"ReplyAll" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
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

-(NSURLSessionDataTask*)forward : (NSString *) Comment : (NSMutableArray<Recipient> *) ToRecipients : (void (^)(int returnValue, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Forward" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
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

-(NSURLSessionDataTask*)send : (void (^)(int returnValue, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"Send" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
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

@end