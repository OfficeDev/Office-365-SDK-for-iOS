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

@interface ODataEntityFetcher : ODataExecutable

-(id)initWith : (NSString *)urlComponent : (ODataExecutable*) parent : (Class) clazz : (Class) operationClazz;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id, NSURLResponse *, NSError *))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id, NSURLResponse *, NSError *))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id , NSURLResponse *, NSError *))callback;
-(DependencyResolver*) getResolver;
-(id) getOperations;

@end