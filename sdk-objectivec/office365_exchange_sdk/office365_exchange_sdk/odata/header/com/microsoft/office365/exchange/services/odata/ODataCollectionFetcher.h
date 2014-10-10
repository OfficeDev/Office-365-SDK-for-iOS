/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import <Foundation/Foundation.h>
#import "ODataExecutable.h"
#import "ODataEntityFetcher.h"
#import "ODataOperations.h"

@interface ODataCollectionFetcher : NSObject<ODataExecutable>


-(NSURLSessionDataTask *)execute:(void (^)(id entity, NSError *error))callback;
-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent :(Class)clazz :(Class)operationClazz;
-(ODataCollectionFetcher*)select : (NSString*) params;
-(ODataCollectionFetcher*)filter : (NSString*) params;
-(ODataCollectionFetcher*)top : (int) value;
-(ODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (NSString*) path : (NSData*) content : (MSOHttpVerb) verb :(void (^)(id<MSOResponse>, NSError *))callback;
-(id<MSODependencyResolver>)getResolver;
-(NSURLSessionDataTask *)add : (id) entity :(void (^)(id, NSError *))callback;
-(ODataEntityFetcher*)getById : (NSString*)Id;

@end
