/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOutlookODataEntities.h"

/**
* The implementation file for type MSOutlookMessageOperations.
*/

@implementation MSOutlookMessageOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}


-(NSURLSessionTask*) copy : (NSString *) destinationId :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;{
	
	NSString * destinationIdString = [[[self getResolver] getJsonSerializer] serialize:destinationId : @"DestinationId"];

	NSURLSessionTask* task = [self copyRaw 	: destinationIdString :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) copyRaw : (NSString*) destinationId :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	NSArray* parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId", nil], nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload : parameters
                                                                  :[self getResolver]]dataUsingEncoding
                                                                  :NSUTF8StringEncoding];
	[request setContent:payload];

	
	[[request getUrl] appendPathComponent:@"Copy"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				

-(NSURLSessionTask*) move : (NSString *) destinationId :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;{
	
	NSString * destinationIdString = [[[self getResolver] getJsonSerializer] serialize:destinationId : @"DestinationId"];

	NSURLSessionTask* task = [self moveRaw 	: destinationIdString :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) moveRaw : (NSString*) destinationId :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	NSArray* parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId", nil], nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload : parameters
                                                                  :[self getResolver]]dataUsingEncoding
                                                                  :NSUTF8StringEncoding];
	[request setContent:payload];

	
	[[request getUrl] appendPathComponent:@"Move"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				

-(NSURLSessionTask*) createReply :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;{
	

	NSURLSessionTask* task = [self createReplyRaw  :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) createReplyRaw :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	
	
	[[request getUrl] appendPathComponent:@"CreateReply"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				

-(NSURLSessionTask*) createReplyAll :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;{
	

	NSURLSessionTask* task = [self createReplyAllRaw  :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) createReplyAllRaw :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	
	
	[[request getUrl] appendPathComponent:@"CreateReplyAll"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				

-(NSURLSessionTask*) createForward :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;{
	

	NSURLSessionTask* task = [self createForwardRaw  :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) createForwardRaw :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	
	
	[[request getUrl] appendPathComponent:@"CreateForward"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				

-(NSURLSessionTask*) reply : (NSString *) comment :  (void (^)(int returnValue, MSODataException *error)) callback;{
	
	NSString * commentString = [[[self getResolver] getJsonSerializer] serialize:comment : @"Comment"];

	NSURLSessionTask* task = [self replyRaw 	: commentString :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : nil];
            callback(result, error);
        }
        else{
            callback((int)[returnValue integerValue], error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) replyRaw : (NSString*) comment :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	NSArray* parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment", nil], nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload : parameters
                                                                  :[self getResolver]]dataUsingEncoding
                                                                  :NSUTF8StringEncoding];
	[request setContent:payload];

	
	[[request getUrl] appendPathComponent:@"Reply"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				

-(NSURLSessionTask*) replyAll : (NSString *) comment :  (void (^)(int returnValue, MSODataException *error)) callback;{
	
	NSString * commentString = [[[self getResolver] getJsonSerializer] serialize:comment : @"Comment"];

	NSURLSessionTask* task = [self replyAllRaw 	: commentString :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : nil];
            callback(result, error);
        }
        else{
            callback((int)[returnValue integerValue], error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) replyAllRaw : (NSString*) comment :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	NSArray* parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment", nil], nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload : parameters
                                                                  :[self getResolver]]dataUsingEncoding
                                                                  :NSUTF8StringEncoding];
	[request setContent:payload];

	
	[[request getUrl] appendPathComponent:@"ReplyAll"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				

-(NSURLSessionTask*) forward : (NSString *) comment : (MSOutlookRecipient *) toRecipients :  (void (^)(int returnValue, MSODataException *error)) callback;{
	
	NSString * commentString = [[[self getResolver] getJsonSerializer] serialize:comment : @"Comment"];
	NSString * toRecipientsString = [[[self getResolver] getJsonSerializer] serialize:toRecipients : @"ToRecipients"];

	NSURLSessionTask* task = [self forwardRaw 	: commentString: toRecipientsString :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : nil];
            callback(result, error);
        }
        else{
            callback((int)[returnValue integerValue], error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) forwardRaw : (NSString*) comment : (NSString*) toRecipients :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	NSArray* parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys :toRecipients,@"ToRecipients", nil], nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload : parameters
                                                                  :[self getResolver]]dataUsingEncoding
                                                                  :NSUTF8StringEncoding];
	[request setContent:payload];

	
	[[request getUrl] appendPathComponent:@"Forward"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				

-(NSURLSessionTask*) send :  (void (^)(int returnValue, MSODataException *error)) callback;{
	

	NSURLSessionTask* task = [self sendRaw  :^(NSString *returnValue, MSODataException *error){
       
	   if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] : nil];
            callback(result, error);
        }
        else{
            callback((int)[returnValue integerValue], error);
        }
    }];
    
    return task;
}

-(NSURLSessionTask*) sendRaw :  (void(^)(NSString* returnValue, MSODataException *error)) callback;{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	
	
	[[request getUrl] appendPathComponent:@"Send"];
	[request setVerb:POST];

	NSURLSessionTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        
		if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}
    				
@end