/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryObjectOperations.h"
#import "MSDirectoryBaseODataContainerHelper.h"

/**
* The implementation file for type MSDirectoryDirectoryObjectOperations.
*/

@implementation MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)checkMemberGroups : (NSMutableArray *) groupIds : (void (^)(NSArray* r, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

    NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:groupIds,@"groupIds", nil];
    
	NSString* parameters = [MSDirectoryBaseODataContainerHelper getFunctionParameters: params];
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

-(NSURLSessionDataTask*)getMemberGroups : (bool) securityEnabledOnly : (void (^)(NSArray* r, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

    NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:(securityEnabledOnly ? @"true" :@"false"),@"securityEnabledOnly", nil];

	NSString* parameters = [MSDirectoryBaseODataContainerHelper getFunctionParameters: params];
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

-(NSURLSessionDataTask*)getMemberObjects : (bool) securityEnabledOnly : (void (^)(NSArray* r, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

    NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys :(securityEnabledOnly ? @"true" : @"false"),@"securityEnabledOnly",nil];

	NSString* parameters = [MSDirectoryBaseODataContainerHelper getFunctionParameters: params];
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