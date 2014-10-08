/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import <Foundation/Foundation.h>
#import "ODataExecutable.h"
#import "ODataEntityFetcher.h"
#import "ODataOperations.h"

@interface ODataCollectionFetcher : ODataExecutable

-(NSURLSessionDataTask *)execute:(void (^)(id, NSURLResponse *, NSError *))callback;
-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent :(Class)clazz :(Class)operationClazz;
-(ODataCollectionFetcher*)select : (NSString*) params;
-(ODataCollectionFetcher*)filter : (NSString*) params;
-(ODataCollectionFetcher*)top : (int) value;
-(ODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (NSString*) path : (NSData*) content : (MSOHttpVerb) verb :(void (^)(NSData *, NSURLResponse *, NSError *))callback;
-(id<MSODependencyResolver>)getResolver;
-(NSURLSessionDataTask *)add : (id) entity :(void (^)(id, NSURLResponse *, NSError *))callback;
-(id)getById : (NSString*)Id;

@end
