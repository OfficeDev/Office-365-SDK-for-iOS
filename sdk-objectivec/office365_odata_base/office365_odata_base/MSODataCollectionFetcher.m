/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataCollectionFetcher.h"
#import "MSODataBaseContainerHelper.h"
#import "MSODataEntityFetcherHelper.h"

@interface MSODataCollectionFetcher()

@property NSString* filter;
@property NSString* select;
@property int top;
@property int skip;
@property NSString* expand;
@property NSString* orderBy;
@property NSString* selectedId;
@property Class entityClass;
@property id operations;

@end

/**
* The implementation file for type MSOutlookODataCollectionFetcher.
*/

@implementation MSODataCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent andEntityClass:(Class)clazz{

    self.urlComponent = urlComponent;
    self.parent = parent;
    self.entityClass = clazz;
    [self reset];
    self.CustomParameters = [[NSMutableDictionary alloc] init];
    self.CustomHeaders = [[NSMutableDictionary alloc] init];
   // self.operations = [[operationClass alloc] initWith:@"" : self];

    return self;
}

-(MSODataCollectionFetcher*)select : (NSString*) params{
    self.select = params;
    return self;
}

-(MSODataCollectionFetcher*)filter : (NSString*) params{
    self.filter = params;
    return self;
}

-(MSODataCollectionFetcher*)top : (int) value{
    
    self.top = value;
    return self;
}

-(MSODataCollectionFetcher*)expand : (NSString*) value{
    
    self.expand = value;
    return self;
}

-(MSODataCollectionFetcher*)skip : (int) value{
    self.skip = value;
    return self;
}

-(MSODataCollectionFetcher*)orderBy : (NSString*) params{
    self.orderBy = params;
    return self;
}

-(NSURLSessionDataTask *)oDataExecuteWithRequest:(id<MSODataRequest>)request callback:(void (^)(id<MSODataResponse>, MSODataException *))callback{
    [[request getUrl] appendPathComponent:self.UrlComponent];
    
    [MSODataEntityFetcherHelper setPathForCollections:[request getUrl] :self.UrlComponent :self.top :self.skip :self.select :self.expand :self.filter : self.orderBy];
    
    [MSODataBaseContainerHelper addCustomParametersToODataURL:request:[self getCustomParameters] : [self getCustomHeaders]:[self getResolver]];
    
    return [self.Parent oDataExecuteWithRequest:request callback:callback];
}

-(NSDictionary*)getCustomParameters{
    return self.CustomParameters;
}

-(MSODataCollectionFetcher*)addCustomParameters : (NSString*)name : (id)value{
    NSDictionary* dicc = [[NSDictionary alloc] initWithObjectsAndKeys:value, name, nil];
    [self.CustomParameters addEntriesFromDictionary:dicc];
    return self;
}

-(id<MSODataDependencyResolver>)getResolver{
    return [self.Parent getResolver];
}

-(NSURLSessionDataTask *)read:(void (^)(id, MSODataException *))callback{

    id<MSODataRequest> request = [[self getResolver] createODataRequest];
    [request setVerb:GET];
    
    return [self oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *e) {
        id result = [[[self getResolver]getJsonSerializer] deserializeList:[r getPayload] : self.entityClass];
        callback(result, e);
    }];
}

-(NSURLSessionDataTask *)add : (id) entity :(void (^)(id, MSODataException *))callback{
    
    NSString* payload = [[[self getResolver] getJsonSerializer] serialize:entity];
    id<MSODataRequest> request = [[self getResolver] createODataRequest];

    [request setVerb:POST];
    [request setContent:[payload dataUsingEncoding:NSUTF8StringEncoding]];

    return [self oDataExecuteWithRequest:request callback:^(id<MSODataResponse> r, MSODataException *e) {
        id result = [[[self getResolver]getJsonSerializer] deserialize:[r getPayload] : self.entityClass];
        callback(result, e);
    }];
}

-(MSODataEntityFetcher*)getById : (NSString*)Id{
    
    self.selectedId = Id;
    
    MSODataEntityFetcher* fetcher = [[MSODataEntityFetcher alloc] initWithUrl:@"" parent:self andEntityClass:self.entityClass];
    
    return fetcher;
}

-(void)reset{
    self.top = -1;
    self.skip = -1;
    self.selectedId = nil;
    self.select = nil;
    self.orderBy = nil;
    self.expand = nil;
    self.filter = nil;
}

@end