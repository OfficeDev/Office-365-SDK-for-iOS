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
@property NSString* selectedId;
@property Class entityClass;
@property id operations;

@end

/**
* The implementation file for type MSOutlookODataCollectionFetcher.
*/

@implementation MSODataCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent andEntityClass:(Class)clazz{

    self.urlComponent = urlComponent;
    self.parent = parent;
    self.entityClass = clazz;
    [self reset];
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

-(NSURLSessionDataTask *)oDataExecuteForPath:(id<MSODataURL>)path withContent:(NSData *)content andMethod:(MSODataHttpVerb)verb andCallback:(void (^)(id<MSODataResponse>, NSError *))callback{
    
    [path appendPathComponent:self.UrlComponent];
    if (self.selectedId == nil) {
        [MSODataEntityFetcherHelper setPathForCollections:path :self.UrlComponent :self.top :self.skip :self.select :self.expand :self.filter];
    }
    else {
        [MSODataEntityFetcherHelper setPathForCollections:path :self.UrlComponent :self.top :self.skip :self.select :self.expand :self.filter];
        [MSODataBaseContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];
    }
    
    return [self.Parent oDataExecuteForPath:path withContent:content andMethod:verb andCallback : callback];
}

-(NSDictionary*)getCustomParameters{
    return self.CustomParameters;
}

-(void)addCustomParameters : (NSString*)name : (NSString*)value{
    NSDictionary* dicc = [[NSDictionary alloc] initWithObjectsAndKeys:value, name, nil];
    [self.CustomParameters addEntriesFromDictionary:dicc];
}

-(id<MSODataDependencyResolver>)getResolver{
    return [self.Parent getResolver];
}

-(NSURLSessionDataTask *)read:(void (^)(id, NSError *))callback{
    
    return [self oDataExecuteForPath:[[self getResolver] createODataURL]  withContent:nil andMethod:GET andCallback:
            ^(id<MSODataResponse> d, NSError *e) {

        id result = [[[self getResolver]getJsonSerializer] deserializeList:[d getData] : self.entityClass];
        callback(result, e);
    }];
}

-(NSURLSessionDataTask *)add : (id) entity :(void (^)(id, NSError *))callback{
    
    NSString* payload = [[[self getResolver] getJsonSerializer] serialize:entity];
    
    return [self oDataExecuteForPath:[[self getResolver] createODataURL]  withContent:[payload dataUsingEncoding:NSUTF8StringEncoding] andMethod:POST andCallback:^(id<MSODataResponse> d, NSError *e) {
        
        id result = [[[self getResolver]getJsonSerializer] deserialize:[d getData] : self.entityClass];
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
    self.expand = nil;
    self.filter = nil;
}

@end
