/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryODataExecutable.h"
#import "MSDiscoveryODataEntityFetcher.h"
#import <office365_odata_base/MSDependencyResolver.h>
/**
* The header for type MSDiscoveryODataCollectionFetcher.
*/

@interface MSDiscoveryODataCollectionFetcher : MSDiscoveryODataExecutable

-(NSURLSessionDataTask *)execute:(void (^)(id entity, NSError *error))callback;

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataExecutable>)parent : (Class)entityClass;
-(MSDiscoveryODataCollectionFetcher*)select : (NSString*) params;
-(MSDiscoveryODataCollectionFetcher*)filter : (NSString*) params;
-(MSDiscoveryODataCollectionFetcher*)top : (int) value;
-(MSDiscoveryODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (id<MSODataURL>) path : (NSData*) content : (MSHttpVerb) verb :(void (^)(id<MSResponse>, NSError *))callback;
-(id<MSDependencyResolver>)getResolver;
-(NSURLSessionDataTask*)add : (id) entity :(void (^)(id result, NSError* error))callback;
-(MSDiscoveryODataEntityFetcher*)getById : (NSString*) Id;

@end
