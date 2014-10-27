/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookMessageOperations.h"
#import "MSOutlookBaseODataContainerHelper.h"

/**
* The implementation file for type MSOutlookMessageOperations.
*/

@implementation MSOutlookMessageOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOutlookMessage *message, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId",nil ],nil];

	NSData* payload = [[MSOutlookBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Copy"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOutlookMessage *message, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId",nil ],nil];

	NSData* payload = [[MSOutlookBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Move"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)createReply : (void (^)(MSOutlookMessage *message, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			
	NSData* payload = nil;
	[url appendPathComponent:@"CreateReply"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)createReplyAll : (void (^)(MSOutlookMessage *message, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			
	NSData* payload = nil;
	[url appendPathComponent:@"CreateReplyAll"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)createForward : (void (^)(MSOutlookMessage *message, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			
	NSData* payload = nil;
	[url appendPathComponent:@"CreateForward"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSOutlookMessage * result = (MSOutlookMessage *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOutlookMessage class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)reply : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],nil];

	NSData* payload = [[MSOutlookBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Reply"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback([r getStatus], error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)replyAll : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],nil];

	NSData* payload = [[MSOutlookBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"ReplyAll"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback([r getStatus], error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)forward : (NSString *) comment : (NSMutableArray<MSOutlookRecipient> *) toRecipients : (void (^)(int returnValue, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :toRecipients,@"ToRecipients",nil ],nil];

	NSData* payload = [[MSOutlookBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Forward"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback([r getStatus], error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)send : (void (^)(int returnValue, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			
	NSData* payload = nil;
	[url appendPathComponent:@"Send"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback([r getStatus], error);
        }
    }];
    
    return task;
}			

@end
