/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSODataOperations.h"
#import "MSODataBaseContainerHelper.h"

@interface MSODataEntityFetcher()

@property Class entityClass;
@property MSODataOperations* operations;

@end

@implementation MSODataEntityFetcher

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent andEntityClass:(Class)entityClass{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    self.operations = [[MSODataOperations alloc] initOperationWithUrl:@"" parent:parent];
    self.entityClass = entityClass;
    self.CustomParameters = [[NSMutableDictionary alloc] init];
    return self;
}

-(NSURLSessionDataTask *)oDataExecuteWithRequest:(id<MSODataRequest>)request callback:(void (^)(id<MSODataResponse>, NSError *))callback{
    [[request getUrl] appendPathComponent:self.UrlComponent];
    [MSODataBaseContainerHelper addCustomParametersToODataURL:[request getUrl] :[self getCustomParameters]:[self getResolver]];
    
    return [self.Parent oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, NSError *e) {
        callback(r,e);
    }];
}

-(NSURLSessionDataTask*) update:(id)updatedEntity : (void (^)(id, NSError *))callback{
    
    NSString *payload = [[[self getResolver] getJsonSerializer]serialize:updatedEntity];
    
    id<MSODataRequest> request = [[self getResolver] createODataRequest];
    
    [request setContent:[payload dataUsingEncoding:NSUTF8StringEncoding]];
    [request setVerb:PATCH];
    
    
    return [self oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, NSError *e) {
        callback(updatedEntity, e);
    }];
}

-(NSURLSessionDataTask*) delete : (void (^)(int,NSError *))callback{
    
    id<MSODataRequest> request = [[self getResolver] createODataRequest];
    [request setVerb:DELETE];
    return [self oDataExecuteWithRequest:request callback:^(id<MSODataResponse>r, NSError *e) {
        callback([r getStatus], e);
    }];
}

-(NSURLSessionDataTask *)read:(void (^)(id, NSError *))callback{
    
    id<MSODataRequest> request = [[self getResolver] createODataRequest];
    [request setVerb:GET];
    
    return [self oDataExecuteWithRequest:request callback:^(id<MSODataResponse>r, NSError *e) {
        if (e == nil) {
            id entity = [[[self getResolver] getJsonSerializer] deserialize:[r getData] :self.entityClass];
            
            callback(entity, e);
        }
        else callback(nil, e);
    }];
}

-(MSODataEntityFetcher*)addCustomParameters : (NSString*)name : (NSString*)value{
    NSDictionary* dicc = [[NSDictionary alloc] initWithObjectsAndKeys:value, name, nil];
    [self.CustomParameters addEntriesFromDictionary:dicc];
    return self;
}

-(id<MSODataDependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end