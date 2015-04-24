/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSODataException.h"

@protocol MSODataRequest;
@protocol MSODataResponse;

@protocol MSODataHttpTransport

- (id<MSODataRequest>)createRequest;
- (NSURLSessionTask *)executeRequest:(id<MSODataRequest>)request
                            callback:(void (^)(id<MSODataResponse> response, MSODataException *exception))callback;

@end