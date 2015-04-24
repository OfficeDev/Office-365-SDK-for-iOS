/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"

@class MSODataOperations;

@protocol MSODataEntityFetcher <MSODataExecutable>

@required

- (NSURLSessionTask *)updateEntity:(id)entity
                          callback:(void (^)(id updatedEntity, MSODataException *exception))callback;

- (NSURLSessionTask *)deleteWithCallback:(void (^)(int statusCode, MSODataException *exception))callback;

- (NSURLSessionTask *)updateRaw:(NSString*)payload
                       callback:(void (^)(NSString*, MSODataException *))callback;
    
@optional

@property (copy, nonatomic, readonly) id operations;

- (id<MSODataEntityFetcher>)select:(NSString *)params;
- (id<MSODataEntityFetcher>)expand:(NSString *)value;

@end

@interface MSODataEntityFetcher : MSODataExecutable<MSODataEntityFetcher>

@end