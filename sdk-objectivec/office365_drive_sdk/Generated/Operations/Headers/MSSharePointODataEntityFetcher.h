/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataExecutable.h"

/**
* The header for type MSSharePointODataEntityFetcher.
*/

@protocol MSSharePointODataEntityFetcher

@optional
-(id) getOperations;

@required

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent : (Class) entityClass;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb :(void (^)(id<MSResponse>, NSError *))callback;

-(id<MSDependencyResolver>) getResolver;

@end

@interface MSSharePointODataEntityFetcher : MSSharePointODataExecutable<MSSharePointODataEntityFetcher>

@end