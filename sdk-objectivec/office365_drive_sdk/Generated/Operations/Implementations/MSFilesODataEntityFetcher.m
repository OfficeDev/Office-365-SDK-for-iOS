/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataEntityFetcher.h"

@interface MSFilesODataEntityFetcher()

@property Class entityClass;
@property MSFilesODataOperations* operations;

@end

/**
* The implementation file for type MSFilesODataEntityFetcher.
*/

@implementation MSFilesODataEntityFetcher

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent : (Class) entityClass{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    self.operations = [[MSOODataOperations alloc] initOperationWithUrl:@"" Parent:parent];
    self.entityClass = entityClass;
    return self;
}

-(NSURLSessionDataTask*) oDataExecute:(id<MSFilesODataURL>)path :(NSData *)content :(MSFilesHttpVerb)verb :(void (^)(id<MSFilesResponse>, NSError *))callback{
    [path appendPathComponent:self.UrlComponent];
    [MSFilesBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];

    return [self.Parent oDataExecute:path :content :verb :^(id<MSFilesResponse> r, NSError *e) {
        callback(r,e);
    }];
}

-(NSURLSessionDataTask*) update:(id)updatedEntity : (void (^)(id, NSError *))callback{
    NSString *payload = [[[self getResolver] getJsonSerializer]serialize:updatedEntity];
    
    return [self oDataExecute:[[self getResolver] createODataURL] :[payload dataUsingEncoding:NSUTF8StringEncoding] : PATCH : ^(id<MSFilesResponse> r, NSError *e) {
        callback(updatedEntity, e);
    }];
}

-(NSURLSessionDataTask*) delete : (void (^)(id,NSError *))callback{
    return [self oDataExecute:[[self getResolver] createODataURL]  :nil :DELETE :^(id<MSFilesResponse> r, NSError *e) {
        callback(r, e);
    }];
}

-(NSURLSessionDataTask *)execute:(void (^)(id, NSError *))callback{
    return [self oDataExecute:[[self getResolver] createODataURL]  :nil :GET :^(id<MSFilesResponse> r, NSError *e) {
        if (e == nil) {
            id entity = [[[self getResolver] getJsonSerializer] deserialize:[r getData] :self.entityClass];
            
            callback(entity, e);
        }
        else callback(nil, e);
    }];
}

-(id<MSFilesDependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
