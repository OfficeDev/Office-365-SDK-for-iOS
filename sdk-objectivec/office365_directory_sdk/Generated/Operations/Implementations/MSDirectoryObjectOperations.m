/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryObjectOperations.h"

/**
* The implementation file for type MSDirectoryObjectOperations.
*/

@implementation MSDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)checkMemberGroups : (NSMutableArray *) groupIds : (void (^)(NSString* result, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

    NSArray* params = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :groupIds,@"groupIds",nil ],nil];

	NSString* parameters = [MSBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"checkMemberGroups(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :GET :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
            callback([[[self getResolver]getJsonSerializer] deserialize:[r getData] : [NSString class]], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)getMemberGroups : (bool) securityEnabledOnly : (void (^)(NSString* result, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

    NSArray* params = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :(securityEnabledOnly ? @"true" : @"false"),@"securityEnabledOnly",nil ],nil];

	NSString* parameters = [MSBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"getMemberGroups(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :GET :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
            callback([[[self getResolver]getJsonSerializer] deserialize:[r getData] : [NSString class]], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)getMemberObjects : (bool) securityEnabledOnly : (void (^)(NSString* result, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* params = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :(securityEnabledOnly ? @"true" : @"false"),@"securityEnabledOnly",nil ],nil];

	NSString* parameters = [MSBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"getMemberObjects(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :GET :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
            callback([[[self getResolver]getJsonSerializer] deserialize:[r getData] : [NSString class]], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end