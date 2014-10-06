//
//  ODataCollectionFetcher.h
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

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
-(NSURLSessionDataTask*)oDataExecute : (NSString*) path : (NSData*) content : (HttpVerb) verb :(void (^)(NSData *, NSURLResponse *, NSError *))callback;
-(DependencyResolver *)getResolver;
-(NSURLSessionDataTask *)add : (id) entity :(void (^)(id, NSURLResponse *, NSError *))callback;
-(id)getById : (NSString*)Id;

@end