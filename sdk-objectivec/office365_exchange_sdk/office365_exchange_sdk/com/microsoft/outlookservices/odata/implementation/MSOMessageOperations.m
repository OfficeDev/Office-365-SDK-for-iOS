/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOMessageOperations.h"

/**
* The implementation file for type MSOMessageOperations.
*/

@implementation MSOMessageOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOMessage *message, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"Copy" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOMessage *message, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"Move" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)createReply : (void (^)(MSOMessage *message, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"CreateReply" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)createReplyAll : (void (^)(MSOMessage *message, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"CreateReplyAll" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)createForward : (void (^)(MSOMessage *message, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"CreateForward" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)reply : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"Reply" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)replyAll : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"ReplyAll" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)forward : (NSString *) comment : (NSMutableArray<MSORecipient> *) toRecipients : (void (^)(int returnValue, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"Forward" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)send : (void (^)(int returnValue, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"Send" :nil :POST :^(id<MSOResponse> r, NSError *error) {
        	
       /*if(error == nil){
           int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
           callback(result, error);
        }
        else{
            callback(0, error);
        }*/
    }];
    
    return task;
}			

@end