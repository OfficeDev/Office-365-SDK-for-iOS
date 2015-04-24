/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSODataOperations.h"
#import "MSODataJsonSerializer.h"
#import "MSODataBaseContainerHelper.h"
#import "MSODataRequest.h"
#import "MSODataURL.h"

@interface MSODataEntityFetcher()

@property (copy, nonatomic, readonly) NSString *select;
@property (copy, nonatomic, readonly) NSString *expand;

@end

@implementation MSODataEntityFetcher

@synthesize operations = _operations;

- (instancetype)initWithUrl:(NSString *)urlComponent
                     parent:(id<MSODataExecutable>)parent asClass:(Class)entityClass {
    
    if (self = [super initWithUrl:urlComponent parent:parent asClass:entityClass]) {
    
        _operations = [[MSODataOperations alloc] initOperationWithUrl:@"" parent:parent];
        _expand = nil;
        _select = nil;
    }
    
    return self;
}

- (NSURLSessionTask *)oDataExecuteRequest:(id<MSODataRequest>)request
                                 callback:(void (^)(id<MSODataResponse> response, MSODataException *exception))callback {
    
    id<MSODataURL> url = request.url;
    
    [url appendPathComponent:self.urlComponent];
    
    if (self.select != nil) {
        
        [url addQueryStringParameter:@"$select" value:self.select];
    }
    
    if (self.expand != nil) {
        
        [url addQueryStringParameter:@"$expand" value:self.expand];
    }
    
    [MSODataBaseContainerHelper addCustomParametersToODataURLWithRequest:request
                                                              parameters:self.customParameters
                                                                 headers:self.customHeaders
                                                      dependencyResolver:super.resolver];
    
    return [super.parent oDataExecuteRequest:request callback:^(id<MSODataResponse> r, MSODataException *e) {
        
        callback(r,e);
    }];
}

- (NSURLSessionTask *)updateEntity:(id)entity
                          callback:(void (^)(id updatedEntity, MSODataException *exception))callback {
    
    NSString *payload = [self.resolver.jsonSerializer serialize:entity];
    
    return [self updateRaw:payload callback:^(NSString *response, MSODataException *e) {
        
        if (e == nil) {
            
            id entity = [self.resolver.jsonSerializer deserialize:[response dataUsingEncoding:NSUTF8StringEncoding]
                                                          asClass:self.entityClass];
            
            callback(entity, e);
        }
        else {
            
            callback(nil, e);
        }
    }];
}

- (NSURLSessionTask *)updateRaw:(NSString*)payload
                       callback:(void (^)(NSString *entityResponse, MSODataException *exception))callback {
    
    id<MSODataRequest> request = [self.resolver createODataRequest];
    

    [request setContent:[NSMutableData dataWithData:[payload dataUsingEncoding:NSUTF8StringEncoding]]];
    [request setVerb:HTTP_VERB_PATCH];
    
    return [self oDataExecuteRequest:request callback:^(id<MSODataResponse> response, MSODataException *e) {
        
        if (e == nil) {
            
            callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {
            
            callback(nil, e);
        }
    }];
}

-(NSURLSessionTask *)deleteWithCallback:(void (^)(int statusCode, MSODataException *exception))callback {
    
    id<MSODataRequest> request = [self.resolver createODataRequest];
    
    [request setVerb:HTTP_VERB_DELETE];
    
    return [self oDataExecuteRequest:request callback:^(id<MSODataResponse> r, MSODataException *e) {
        
        callback(r.status, e);
    }];
}

- (NSURLSessionTask *)readRawWithCallback:(void (^)(NSString *entityString, MSODataException *exception))callback {
    
    id<MSODataRequest> request = [self.resolver createODataRequest];
    
    return [self oDataExecuteRequest:request callback:^(id<MSODataResponse> response, MSODataException *e) {
        
        if (e == nil) {
            
            callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {
            
            callback(nil, e);
        }
    }];
}

- (NSURLSessionTask *)readWithCallback:(void (^)(id, MSODataException *))callback {
    
    return [self readRawWithCallback:^(NSString *r, MSODataException *e) {
        
        if (e == nil) {
            
            id entity = [self.resolver.jsonSerializer deserialize:[r dataUsingEncoding:NSUTF8StringEncoding]
                                                          asClass:self.entityClass];
            
            callback(entity, e);
        }
        else {
            
            callback(nil, e);
        }
    }];
}

- (MSODataEntityFetcher *)select:(NSString *)params {
    
    _select = params;
    
    return self;
}

- (MSODataEntityFetcher *)expand:(NSString *)value {
    
    _expand = value;
    
    return self;
}

@end