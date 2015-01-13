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

#import "MSOutlookMessageOperations.h"

/**
* The implementation file for type MSOutlookMessageOperations.
*/

@implementation MSOutlookMessageOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}

-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOutlookMessage *message, MSODataException *error))callback{
	
	NSString * destinationIdString = [[[self getResolver] getJsonSerializer] serialize:destinationId : @"DestinationId"];

	NSURLSessionDataTask* task = [self copyRaw 	: destinationIdString :^(NSString *returnValue, MSODataException *error){
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

-(NSURLSessionDataTask*)copyRaw : (NSString*) destinationId : (void (^)(NSString*message, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"Copy"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				


-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOutlookMessage *message, MSODataException *error))callback{
	
	NSString * destinationIdString = [[[self getResolver] getJsonSerializer] serialize:destinationId : @"DestinationId"];

	NSURLSessionDataTask* task = [self moveRaw 	: destinationIdString :^(NSString *returnValue, MSODataException *error){
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

-(NSURLSessionDataTask*)moveRaw : (NSString*) destinationId : (void (^)(NSString*message, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"Move"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				


-(NSURLSessionDataTask*)createReply : (void (^)(MSOutlookMessage *message, MSODataException *error))callback{
	

	NSURLSessionDataTask* task = [self createReplyRaw  :^(NSString *returnValue, MSODataException *error){
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

-(NSURLSessionDataTask*)createReplyRaw : (void (^)(NSString*message, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	[[request getUrl] appendPathComponent:@"CreateReply"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				


-(NSURLSessionDataTask*)createReplyAll : (void (^)(MSOutlookMessage *message, MSODataException *error))callback{
	

	NSURLSessionDataTask* task = [self createReplyAllRaw  :^(NSString *returnValue, MSODataException *error){
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

-(NSURLSessionDataTask*)createReplyAllRaw : (void (^)(NSString*message, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	[[request getUrl] appendPathComponent:@"CreateReplyAll"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				


-(NSURLSessionDataTask*)createForward : (void (^)(MSOutlookMessage *message, MSODataException *error))callback{
	

	NSURLSessionDataTask* task = [self createForwardRaw  :^(NSString *returnValue, MSODataException *error){
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

-(NSURLSessionDataTask*)createForwardRaw : (void (^)(NSString*message, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	[[request getUrl] appendPathComponent:@"CreateForward"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				


-(NSURLSessionDataTask*)reply : (NSString *) comment : (void (^)(int returnValue, MSODataException *error))callback{
	
	NSString * commentString = [[[self getResolver] getJsonSerializer] serialize:comment : @"Comment"];

	NSURLSessionDataTask* task = [self replyRaw 	: commentString :^(NSString *returnValue, MSODataException *error){
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

-(NSURLSessionDataTask*)replyRaw : (NSString*) comment : (void (^)(NSString*returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"Reply"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				


-(NSURLSessionDataTask*)replyAll : (NSString *) comment : (void (^)(int returnValue, MSODataException *error))callback{
	
	NSString * commentString = [[[self getResolver] getJsonSerializer] serialize:comment : @"Comment"];

	NSURLSessionDataTask* task = [self replyAllRaw 	: commentString :^(NSString *returnValue, MSODataException *error){
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

-(NSURLSessionDataTask*)replyAllRaw : (NSString*) comment : (void (^)(NSString*returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"ReplyAll"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				


-(NSURLSessionDataTask*)forward : (NSString *) comment : (NSMutableArray<MSOutlookRecipient> *) toRecipients : (void (^)(int returnValue, MSODataException *error))callback{
	
	NSString * commentString = [[[self getResolver] getJsonSerializer] serialize:comment : @"Comment"];
	NSString * toRecipientsString = [[[self getResolver] getJsonSerializer] serialize:toRecipients : @"ToRecipients"];

	NSURLSessionDataTask* task = [self forwardRaw 	: commentString: toRecipientsString :^(NSString *returnValue, MSODataException *error){
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

-(NSURLSessionDataTask*)forwardRaw : (NSString*) comment : (NSString*) toRecipients : (void (^)(NSString*returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :toRecipients,@"ToRecipients",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
[request setContent:payload];

	[[request getUrl] appendPathComponent:@"Forward"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
        if(error == nil){
            callback([[NSString alloc] initWithData:[r getPayload] encoding:NSUTF8StringEncoding], error);
        }
        else{
            callback([[NSString alloc] initWithFormat:@"%d",[r getStatus]], error);
        }
    }];
    
    return task;
}				


-(NSURLSessionDataTask*)send : (void (^)(int returnValue, MSODataException *error))callback{
	

	NSURLSessionDataTask* task = [self sendRaw  :^(NSString *returnValue, MSODataException *error){
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

-(NSURLSessionDataTask*)sendRaw : (void (^)(NSString*returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
	
	[[request getUrl] appendPathComponent:@"Send"];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
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