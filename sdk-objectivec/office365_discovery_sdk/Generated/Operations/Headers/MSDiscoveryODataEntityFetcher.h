/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryODataExecutable.h"

/**
* The header for type MSDiscoveryODataEntityFetcher.
*/

@protocol MSDiscoveryODataEntityFetcher

@optional
-(id<MSDependencyResolver>) getResolver;
-(id) getOperations;

@required

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataExecutable>)parent : (Class) entityClass;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb :(void (^)(id<MSResponse>, NSError *))callback;

@end

@interface MSDiscoveryODataEntityFetcher : MSDiscoveryODataExecutable<MSDiscoveryODataEntityFetcher>

@end