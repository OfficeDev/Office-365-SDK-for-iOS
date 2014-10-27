#import "MSOutlookODataExecutable.h"

/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

/**
* The header for type MSOutlookODataEntityFetcher.
*/

@protocol MSOutlookODataEntityFetcher <NSObject>


-(id<MSDependencyResolver>) getResolver;
@required
-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent : (Class) entityClass;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb :(void (^)(id<MSResponse>, NSError *))callback;

@optional
-(id) getOperations;

@end

@interface MSOutlookODataEntityFetcher : MSOutlookODataExecutable<MSOutlookODataEntityFetcher>

@end