/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"
#import "MSODataCollectionFetcher.h"
#import "MSODataMediaEntityFetcher.h"
#import "MSODataMultiPartElement.h"

@protocol MSODataMultipartCollectionFetcher<MSODataCollectionFetcher>

@optional

- (instancetype)initWithUrl:(NSString *)urlComponent
                     parent:(id<MSODataExecutable>)parent
                    asClass:(Class)theClass;

- (NSURLSessionTask *)addParts:(NSArray<MSODataMultiPartElement> *)parts
                  withCallback:(void (^)(id<MSODataResponse> response, MSODataException *exception))callback;

- (MSODataMediaEntityFetcher *)getById:(NSString *)Id;

@end

@interface MSODataMultipartCollectionFetcher : MSODataCollectionFetcher<MSODataMultipartCollectionFetcher>

@end