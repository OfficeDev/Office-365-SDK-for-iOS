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

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent andEntityClass:(Class)entityClass{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    self.operations = [[MSODataOperations alloc] initOperationWithUrl:@"" parent:parent];
    self.entityClass = entityClass;
    return self;
}

-(NSURLSessionDataTask*) oDataExecuteForPath:(id<MSODataURL>)path withContent:(NSData *)content andMethod:(MSODataHttpVerb)verb andCallback:(void (^)(id<MSODataResponse>, NSError *))callback{
    [path appendPathComponent:self.UrlComponent];
    [MSODataBaseContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];

    return [self.Parent oDataExecuteForPath:path withContent:content andMethod:verb andCallback : ^(id<MSODataResponse> r, NSError *e) {
        callback(r,e);
    }];
}

-(NSURLSessionDataTask*) update:(id)updatedEntity : (void (^)(id, NSError *))callback{
    NSString *payload = [[[self getResolver] getJsonSerializer]serialize:updatedEntity];
    
    return [self oDataExecuteForPath:[[self getResolver] createODataURL] withContent:[payload dataUsingEncoding:NSUTF8StringEncoding] andMethod:PATCH andCallback: ^(id<MSODataResponse> r, NSError *e) {
        callback(updatedEntity, e);
    }];
}

-(NSURLSessionDataTask*) delete : (void (^)(id,NSError *))callback{
    return [self oDataExecuteForPath:[[self getResolver] createODataURL]  withContent:nil andMethod:DELETE andCallback : ^(id<MSODataResponse> r, NSError *e) {
        callback(r, e);
    }];
}

-(NSURLSessionDataTask *)read:(void (^)(id, NSError *))callback{
    return [self oDataExecuteForPath:[[self getResolver] createODataURL] withContent:nil andMethod:GET andCallback : ^(id<MSODataResponse> r, NSError *e) {
        if (e == nil) {
            id entity = [[[self getResolver] getJsonSerializer] deserialize:[r getData] :self.entityClass];
            
            callback(entity, e);
        }
        else callback(nil, e);
    }];
}

-(id<MSODataDependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
