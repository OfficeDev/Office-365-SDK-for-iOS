/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataExecutable.h"
#import "MSSharePointODataEntityFetcher.h"
#import <office365_odata_base/MSDependencyResolver.h>
/**
* The header for type MSSharePointODataCollectionFetcher.
*/

@interface MSSharePointODataCollectionFetcher : MSSharePointODataExecutable

-(NSURLSessionDataTask *)execute:(void (^)(id entity, NSError *error))callback;

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent : (Class)entityClass;
-(MSSharePointODataCollectionFetcher*)select : (NSString*) params;
-(MSSharePointODataCollectionFetcher*)filter : (NSString*) params;
-(MSSharePointODataCollectionFetcher*)top : (int) value;
-(MSSharePointODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (id<MSODataURL>) path : (NSData*) content : (MSHttpVerb) verb :(void (^)(id<MSResponse>, NSError *))callback;
-(id<MSDependencyResolver>)getResolver;
-(NSURLSessionDataTask*)add : (id) entity :(void (^)(id result, NSError* error))callback;
-(MSSharePointODataEntityFetcher*)getById : (NSString*) Id;

@end
