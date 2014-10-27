/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataExecutable.h"
#import "MSOutlookODataEntityFetcher.h"
#import <office365_odata_base/MSDependencyResolver.h>
/**
* The header for type MSOutlookODataCollectionFetcher.
*/

@interface MSOutlookODataCollectionFetcher : MSOutlookODataExecutable

-(NSURLSessionDataTask *)execute:(void (^)(id entity, NSError *error))callback;

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent : (Class)entityClass;
-(MSOutlookODataCollectionFetcher*)select : (NSString*) params;
-(MSOutlookODataCollectionFetcher*)filter : (NSString*) params;
-(MSOutlookODataCollectionFetcher*)top : (int) value;
-(MSOutlookODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (id<MSODataURL>) path : (NSData*) content : (MSHttpVerb) verb :(void (^)(id<MSResponse>, NSError *))callback;
-(id<MSDependencyResolver>)getResolver;
-(NSURLSessionDataTask*)add : (id) entity :(void (^)(id result, NSError* error))callback;
-(MSOutlookODataEntityFetcher*)getById : (NSString*) Id;

@end
