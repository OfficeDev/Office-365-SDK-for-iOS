/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataReadable.h"

@protocol MSODataEntityFetcher

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent andEntityClass : (Class) entityClass;

-(NSURLSessionDataTask*) update: (id)entity : (void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) read:(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) oDataExecuteForPath:(id<MSODataURL>)path withContent:(NSData *)content andMethod:(MSODataHttpVerb)verb andCallback:(void (^)(id<MSODataResponse>, NSError *))callback;

-(id<MSODataDependencyResolver>) getResolver;

@optional
-(id) getOperations;

@end

@interface MSODataEntityFetcher : MSODataReadable<MSODataEntityFetcher>

@end