/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

/**
* The header for type MSOODataEntityFetcher.
*/

@interface MSOODataEntityFetcher : MSOODataExecutable

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent : (Class) entityClass;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) execute:(void (^)(id entity, NSError * error))callback;

-(id<MSODependencyResolver>) getResolver;
-(id) getOperations;

@end
