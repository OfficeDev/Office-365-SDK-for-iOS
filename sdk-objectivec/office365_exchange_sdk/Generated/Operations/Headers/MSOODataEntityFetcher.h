/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSOODataOperations.h"

/**
* The header for type MSOODataEntityFetcher.
*/

@interface MSOODataEntityFetcher : MSOODataExecutable

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent : (Class) entityClass;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id, NSError *))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id, NSError *))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id , NSError *))callback;

-(id<MSODependencyResolver>) getResolver;
-(id) getOperations;

@end
