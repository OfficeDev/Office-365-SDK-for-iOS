/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataExecutable.h"
#import "MSOODataEntityFetcher.h"
#import <office365_odata_base/MSODependencyResolver.h>
/**
* The header for type MSFilesODataCollectionFetcher.
*/

@interface MSFilesODataCollectionFetcher : MSFilesODataExecutable

-(NSURLSessionDataTask *)execute:(void (^)(id entity, NSError *error))callback;

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent : (Class)entityClass;
-(MSFilesODataCollectionFetcher*)select : (NSString*) params;
-(MSFilesODataCollectionFetcher*)filter : (NSString*) params;
-(MSFilesODataCollectionFetcher*)top : (int) value;
-(MSFilesODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (id<MSFilesODataURL>) path : (NSData*) content : (MSFilesHttpVerb) verb :(void (^)(id<MSFilesResponse>, NSError *))callback;
-(id<MSFilesDependencyResolver>)getResolver;
-(NSURLSessionDataTask*)add : (id) entity :(void (^)(id result, NSError* error))callback;
-(MSFilesODataEntityFetcher*)getById : (NSString*) Id;

@end
