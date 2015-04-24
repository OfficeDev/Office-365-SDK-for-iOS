/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataDependencyResolver.h"
#import "MSODataReadable.h"
#import "MSODataResponse.h"
#import "MSODataException.h"

@protocol MSODataExecutable<MSODataReadable>

@optional

@property (copy, nonatomic, readonly) id<MSODataDependencyResolver> resolver;

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent asClass:(Class)entityClass;

- (NSURLSessionTask *)oDataExecuteRequest:(id<MSODataRequest>)request callback:(void (^)(id<MSODataResponse> response, MSODataException *exception))callback;

- (id<MSODataExecutable>)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (id<MSODataExecutable>)addCustomParametersWithName:(NSString *)name value:(NSString *)value;

@required

@property (copy, nonatomic, readonly) NSString *urlComponent;
@property (copy, nonatomic, readonly) id<MSODataExecutable> parent;
@property (copy, nonatomic, readonly) Class entityClass;

@end

@interface MSODataExecutable : NSObject<MSODataExecutable>

@property (copy, nonatomic, readonly) NSMutableDictionary *customParameters;
@property (copy, nonatomic, readonly) NSMutableDictionary *customHeaders;

@end