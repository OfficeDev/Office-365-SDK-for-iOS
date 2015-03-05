/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"

@protocol MSODataEntityFetcher<MSODataExecutable>

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent andEntityClass : (Class) entityClass;

-(NSURLSessionDataTask*) update: (id)entity : (void (^)(id entity, MSODataException * error))callback;
-(NSURLSessionDataTask*) delete : (void (^)(int status, MSODataException * error))callback;
-(id<MSODataDependencyResolver>) getResolver;

-(NSURLSessionDataTask*) updateRaw:(NSString*)payload : (void (^)(NSString*, MSODataException *))callback;
    
@optional
-(id) getOperations;
-(id<MSODataEntityFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSODataEntityFetcher>)addCustomHeaderWithName:(NSString *)name andValue :(NSString *)value;
-(id<MSODataEntityFetcher>)select : (NSString*) params;
-(id<MSODataEntityFetcher>)expand : (NSString*) value;

@end

@interface MSODataEntityFetcher : MSODataExecutable<MSODataEntityFetcher>

@end