/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import <Foundation/Foundation.h>
#import "ODataOperations.h"

@interface ODataEntityFetcher : NSObject<ODataExecutable>

-(id)initWith : (NSString *)urlComponent : (id<ODataExecutable>) parent : (Class) clazz : (Class) operationClazz;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id, NSError *))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id, NSError *))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id , NSError *))callback;

-(id<MSODependencyResolver>) getResolver;
-(id) getOperations;

@end
