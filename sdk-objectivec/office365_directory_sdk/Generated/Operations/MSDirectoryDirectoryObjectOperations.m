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

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent{
    return [super initOperationWithUrl:urlComponent parent:parent];
}

-(NSURLSessionDataTask*)checkMemberGroups : (NSMutableArray *) groupIds : (void (^)(NSArray* r, NSError *error))callback{
    
    id<MSODataURL> url = [[self getResolver] createODataURL];
    
    NSDictionary* params = [[NSDictionary alloc] initWithObjectsAndKeys:groupIds,@"groupIds", nil];
    
    NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
    [url appendPathComponent:[[NSString alloc] initWithFormat:@"checkMemberGroups(%@)",parameters]];
    NSData* payload = nil;
    
    NSURLSessionDataTask* task = [super oDataExecuteForPath:url withContent:payload andMethod:GET andCallback:^(id<MSODataResponse> r, NSError *error) {
        
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
    
    NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
    [url appendPathComponent:[[NSString alloc] initWithFormat:@"getMemberGroups(%@)",parameters]];
    NSData* payload = nil;
    
    NSURLSessionDataTask* task = [super oDataExecuteForPath:url withContent:payload andMethod:GET andCallback:^(id<MSODataResponse> r, NSError *error) {
        
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
    
    NSString* parameters = [MSODataBaseContainerHelper getFunctionParameters: params];
    [url appendPathComponent:[[NSString alloc] initWithFormat:@"getMemberObjects(%@)",parameters]];
    NSData* payload = nil;
    
    NSURLSessionDataTask* task = [super oDataExecuteForPath:url withContent:payload andMethod:GET andCallback:^(id<MSODataResponse> r, NSError *error) {
        
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