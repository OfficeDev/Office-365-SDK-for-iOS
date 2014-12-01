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

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[[request getUrl] appendPathComponent:@"Copy"];
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOutlookMessage *message, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[[request getUrl] appendPathComponent:@"Move"];
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)createReply : (void (^)(MSOutlookMessage *message, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	
	NSData* payload = nil;
	[[request getUrl] appendPathComponent:@"CreateReply"];
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)createReplyAll : (void (^)(MSOutlookMessage *message, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	
	NSData* payload = nil;
	[[request getUrl] appendPathComponent:@"CreateReplyAll"];
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)createForward : (void (^)(MSOutlookMessage *message, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	
	NSData* payload = nil;
	[[request getUrl] appendPathComponent:@"CreateForward"];
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)reply : (NSString *) comment : (void (^)(int returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[[request getUrl] appendPathComponent:@"Reply"];
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : nil];
            callback(result, error);
        }
        else{
            callback([r getStatus], error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)replyAll : (NSString *) comment : (void (^)(int returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[[request getUrl] appendPathComponent:@"ReplyAll"];
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : nil];
            callback(result, error);
        }
        else{
            callback([r getStatus], error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)forward : (NSString *) comment : (NSMutableArray<MSOutlookRecipient> *) toRecipients : (void (^)(int returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :toRecipients,@"ToRecipients",nil ],nil];

	NSData* payload = [[MSODataBaseContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[[request getUrl] appendPathComponent:@"Forward"];
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : nil];
            callback(result, error);
        }
        else{
            callback([r getStatus], error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)send : (void (^)(int returnValue, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	
	NSData* payload = nil;
	[[request getUrl] appendPathComponent:@"Send"];
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : nil];
            callback(result, error);
        }
        else{
            callback([r getStatus], error);
        }
    }];
    
    return task;
}			
@end