/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"

@protocol MSODataEntityFetcher

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent andEntityClass : (Class) entityClass;

-(NSURLSessionDataTask*) update: (id)entity : (void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) delete : (void (^)(int status, NSError * error))callback;
-(id<MSODataDependencyResolver>) getResolver;

@optional
-(id) getOperations;

@end

@interface MSODataEntityFetcher : MSODataExecutable<MSODataEntityFetcher>

@end