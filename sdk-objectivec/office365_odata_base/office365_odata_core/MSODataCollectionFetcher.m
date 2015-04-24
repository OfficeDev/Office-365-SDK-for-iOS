/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataCollectionFetcher.h"
#import "MSODataBaseContainerHelper.h"
#import "MSODataEntityFetcherHelper.h"
#import "MSODataJsonSerializer.h"
#import "MSODataRequest.h"
#import "MSODataURL.h"

@interface MSODataCollectionFetcher ()

@property (nonatomic) int top;
@property (nonatomic) int skip;
@property (copy, nonatomic, readonly) NSString *search;
@property (copy, nonatomic, readonly) NSString *filter;
@property (copy, nonatomic, readonly) NSString *select;
@property (copy, nonatomic, readonly) NSString *expand;
@property (copy, nonatomic, readonly) NSString *orderBy;
@property (copy, nonatomic, readonly) NSString *selectedId;
@property (copy, nonatomic, readonly) id operations;

@end

@implementation MSODataCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent asClass:(Class)theClass {
    
    if (self = [super initWithUrl:urlComponent parent:parent asClass:theClass]) {
    
        [self reset];
    }

    return self;
}

- (MSODataCollectionFetcher *)select:(NSString *)params {
    
    _select = params;
    
    return self;
}

- (MSODataCollectionFetcher *)filter:(NSString *)params {
    
    _filter = params;
    
    return self;
}

- (MSODataCollectionFetcher *)top:(int)value {
    
    _top = value;
    
    return self;
}

- (MSODataCollectionFetcher *)expand:(NSString *)value {
    
    _expand = value;
    
    return self;
}

- (MSODataCollectionFetcher *)skip:(int)value {
    
    _skip = value;
    
    return self;
}

- (MSODataCollectionFetcher *)search:(NSString *)params {
    
    _search = params;
    
    return self;
}

- (MSODataCollectionFetcher *)orderBy:(NSString*)params {
    
    _orderBy = params;
    
    return self;
}

- (NSURLSessionTask *)oDataExecuteRequest:(id<MSODataRequest>)request callback:(void (^)(id<MSODataResponse>, MSODataException *))callback {
    
    [request.url appendPathComponent:self.urlComponent];
    
    [MSODataEntityFetcherHelper setPathForCollectionsWithUrl:request.url
                                                         top:self.top
                                                        skip:self.skip
                                                      select:self.select
                                                      expand:self.expand
                                                      filter:self.filter
                                                     orderby:self.orderBy
                                                      search:self.search];
    
    [MSODataBaseContainerHelper addCustomParametersToODataURLWithRequest:request
                                                              parameters:self.customParameters
                                                                 headers:self.customHeaders
                                                      dependencyResolver:self.resolver];
    
    return [self.parent oDataExecuteRequest:request callback:callback];
}

- (NSURLSessionTask *)readRawWithCallback:(void (^)(NSString *result, MSODataException *exception))callback {
    
    id<MSODataRequest> request = [self.parent.resolver createODataRequest];

    return [self oDataExecuteRequest:request callback:^(id<MSODataResponse> response, MSODataException *e) {
        
        callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
    }];
}

- (NSURLSessionTask *)readWithCallback:(void (^)(id result, MSODataException *exception))callback {
    
    return [self readRawWithCallback:^(NSString *response, MSODataException *e) {
        
        id result =
        [self.parent.resolver.jsonSerializer deserializeList:[response dataUsingEncoding:NSUTF8StringEncoding]
                                                     asClass:self.entityClass];
        
        callback(result, e);
    }];
}

- (NSURLSessionTask *)count:(void (^)(NSInteger result, MSODataException *exception))callback {
    
    id<MSODataRequest> request = [self.parent.resolver createODataRequest];
    
    [[request url] appendPathComponent:@"$count"];
    [self reset];
    
    return [self oDataExecuteRequest:request callback:^(id<MSODataResponse> response, MSODataException *e) {
        
        callback([[[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding] integerValue], e);
    }];
}

- (NSURLSessionTask *)addEntityRaw:(NSString *)payload
                          callback:(void (^)(NSString *result, MSODataException *exception))callback {

    id<MSODataRequest> request = [self.parent.resolver createODataRequest];
    
    [request setVerb:HTTP_VERB_POST];
    [request setContent:[NSMutableData dataWithData:[payload dataUsingEncoding:NSUTF8StringEncoding]]];
    
    return [self oDataExecuteRequest:request callback:^(id<MSODataResponse> response, MSODataException *e) {
        
        callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
    }];
}

- (NSURLSessionTask *)addEntity:(id)entity
                       callback:(void (^)(id entityAdded, MSODataException *exception))callback {
    
    NSString *payload = [self.parent.resolver.jsonSerializer serialize:entity];
    
    __block MSODataCollectionFetcher *_self = self;
    
    return [self addEntityRaw:payload callback:^(NSString *r, MSODataException *e) {
        
        id result = [_self.resolver.jsonSerializer deserialize:[r dataUsingEncoding:NSUTF8StringEncoding]
                                                       asClass:_self.entityClass];
        
        callback(result, e);
    }];
}

- (MSODataEntityFetcher *)getById:(NSString *)theId {
    
    _selectedId = theId;
    
    MSODataEntityFetcher *fetcher = [[MSODataEntityFetcher alloc] initWithUrl:@""
                                                                       parent:self
                                                                      asClass:self.entityClass];
    
    return fetcher;
}

- (void)reset {
    
    _top = -1;
    _skip = -1;
    _selectedId = nil;
    _select = nil;
    _orderBy = nil;
    _expand = nil;
    _filter = nil;
    _search = nil;
}

@end