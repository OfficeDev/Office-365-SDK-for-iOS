/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSORequest.h"
#import "MSOResponse.h"

@protocol MSOHttpTransport

-(id<MSORequest>) createRequest;
-(NSURLSessionDataTask *)execute:(id<MSORequest>)request : (void (^)(id<MSOResponse> response, NSError *error))callback;

@end