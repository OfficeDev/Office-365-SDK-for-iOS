//
//  ODataEntityFetcher.h
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODataOperations.h"
#import "Executable.h"

@protocol ODataEntityFetcher

-(id)initWith : (NSString *)urlComponent : (ODataExecutable*) parent : (Class) clazz : (Class) operationClazz;

-(NSURLSessionDataTask*) oDataExecute:(NSString *)path :(NSData *)content :(HttpVerb)verb callback:(void (^)(NSData *, NSURLResponse *, NSError *))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity callback:(void (^)(id, NSURLResponse *, NSError *))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id, NSURLResponse *, NSError *))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id , NSURLResponse *, NSError *))callback;
-(DependencyResolver*) getResolver;
-(ODataOperations *)getOperations;

@end

@interface ODataEntityFetcher : ODataExecutable<NSObject,ODataOperations>

-(id)initWith : (NSString *)urlComponent : (ODataExecutable*) parent : (Class) clazz : (Class) operationClazz;

@end