/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataExecutable.h"
#import "MSOODataEntityFetcher.h"

/**
* The header for type MSOODataCollectionFetcher.
*/

@interface MSOODataCollectionFetcher : MSOODataExecutable

-(NSURLSessionDataTask *)execute:(void (^)(id entity, NSError *error))callback;

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent : (Class)entityClass;
-(MSOODataCollectionFetcher*)select : (NSString*) params;
-(MSOODataCollectionFetcher*)filter : (NSString*) params;
-(MSOODataCollectionFetcher*)top : (int) value;
-(MSOODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (id<MSOODataURL>) path : (NSData*) content : (MSOHttpVerb) verb :(void (^)(id<MSOResponse>, NSError *))callback;
-(id<MSODependencyResolver>)getResolver;
-(NSURLSessionDataTask*)add : (id) entity :(void (^)(id result, NSError* error))callback;
-(MSOODataEntityFetcher*)getById : (NSString*) Id;

@end
