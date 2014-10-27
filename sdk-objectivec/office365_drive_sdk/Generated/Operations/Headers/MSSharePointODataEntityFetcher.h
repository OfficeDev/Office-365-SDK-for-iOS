#import "MSSharePointODataExecutable.h"

/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"

/**
* The header for type MSSharePointODataEntityFetcher.
*/

@interface MSSharePointODataEntityFetcher : MSSharePointODataExecutable

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent : (Class) entityClass;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb :(void (^)(id<MSResponse>, NSError *))callback;

-(id<MSDependencyResolver>) getResolver;
-(id) getOperations;

@end
