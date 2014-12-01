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

#import "MSDirectoryDirectoryObjectOperations.h"

/**
* The implementation file for type MSDirectoryDirectoryObjectOperations.
*/

@implementation MSDirectoryDirectoryObjectOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}

-(NSURLSessionDataTask*)checkMemberGroups : (NSMutableArray *) groupIds : (void (^)(NSArray*, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:groupIds,@"groupIds",nil];

	NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
	[[request getUrl] appendPathComponent:[[NSString alloc] initWithFormat:@"checkMemberGroups(%@)",parameters]];
	NSData* payload = nil;
		
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
           callback([[[self getResolver] getJsonSerializer] deserialize:[r getPayload] :[NSString class]], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)getMemberGroups : (bool) securityEnabledOnly : (void (^)(NSArray*, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:securityEnabledOnly ? @"true" : @"false",@"securityEnabledOnly", nil];

	NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
	[[request getUrl] appendPathComponent:[[NSString alloc] initWithFormat:@"getMemberGroups(%@)",parameters]];
	NSData* payload = nil;
		
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
            callback([[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [NSString class]], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			


-(NSURLSessionDataTask*)getMemberObjects : (bool) securityEnabledOnly : (void (^)(NSArray*, MSODataException *error))callback{

	id<MSODataRequest> request = [[self getResolver] createODataRequest];
		
	NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:securityEnabledOnly ? @"true" : @"false",@"securityEnabledOnly", nil];

	NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
	[[request getUrl] appendPathComponent:[[NSString alloc] initWithFormat:@"getMemberObjects(%@)",parameters]];
	NSData* payload = nil;
		
	[request setContent:payload];
	[request setVerb:POST];

	NSURLSessionDataTask* task = [super oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *error) {
       if(error == nil){
            callback([[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : [NSString class]], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			
@end