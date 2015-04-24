/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataDependencyResolver.h"
#import "MSODataException.h"

@protocol MSODataReadable

@optional

- (NSURLSessionTask *)readWithCallback:(void (^)(id response, MSODataException *exception))callback;
- (NSURLSessionTask *)readRawWithCallback:(void (^)(NSString *responseString, MSODataException *exception))callback;

@end