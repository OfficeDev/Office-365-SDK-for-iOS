/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataExecutable.h"
#import "MSDirectoryODataEntityFetcher.h"
#import <office365_odata_base/MSDependencyResolver.h>
/**
* The header for type MSDirectoryODataCollectionFetcher.
*/

@interface MSDirectoryODataCollectionFetcher : MSDirectoryODataExecutable

-(NSURLSessionDataTask *)execute:(void (^)(id entity, NSError *error))callback;

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent : (Class)entityClass;
-(MSDirectoryODataCollectionFetcher*)select : (NSString*) params;
-(MSDirectoryODataCollectionFetcher*)filter : (NSString*) params;
-(MSDirectoryODataCollectionFetcher*)top : (int) value;
-(MSDirectoryODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (id<MSODataURL>) path : (NSData*) content : (MSHttpVerb) verb :(void (^)(id<MSResponse>, NSError *))callback;
-(id<MSDependencyResolver>)getResolver;
-(NSURLSessionDataTask*)add : (id) entity :(void (^)(id result, NSError* error))callback;
-(MSDirectoryODataEntityFetcher*)getById : (NSString*) Id;

@end
