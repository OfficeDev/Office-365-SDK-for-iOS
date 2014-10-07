/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import <Foundation/Foundation.h>
#import "ODataOperations.h"

@interface ODataEntityFetcher : ODataExecutable

-(id)initWith : (NSString *)urlComponent : (ODataExecutable*) parent : (Class) clazz : (Class) operationClazz;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id, NSURLResponse *, NSError *))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id, NSURLResponse *, NSError *))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id , NSURLResponse *, NSError *))callback;
-(DependencyResolver*) getResolver;
-(id) getOperations;

@end
