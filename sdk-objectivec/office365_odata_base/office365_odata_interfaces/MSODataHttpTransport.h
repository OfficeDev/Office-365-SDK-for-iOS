/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSODataRequest.h"
#import "MSODataResponse.h"
#import "MSODataException.h"

@protocol MSODataHttpTransport

-(id<MSODataRequest>) createRequest;
-(NSURLSessionDataTask *)execute:(id<MSODataRequest>)request : (void (^)(id<MSODataResponse> response, MSODataException *error))callback;

@end