/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEventOperations.h"

/**
* The implementation file for type MSOEventOperations.
*/

@implementation MSOEventOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)accept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],nil];

	NSData* payload = [[MSOBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Accept"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)decline : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],nil];

	NSData* payload = [[MSOBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Decline"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)tentativelyAccept : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment",nil ],nil];

	NSData* payload = [[MSOBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"TentativelyAccept"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end