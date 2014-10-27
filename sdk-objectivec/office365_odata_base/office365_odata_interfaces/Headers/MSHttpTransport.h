/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSRequest.h"
#import "MSResponse.h"

@protocol MSHttpTransport

-(id<MSRequest>) createRequest;
-(NSURLSessionDataTask *)execute:(id<MSRequest>)request : (void (^)(id<MSResponse> response, NSError *error))callback;

@end