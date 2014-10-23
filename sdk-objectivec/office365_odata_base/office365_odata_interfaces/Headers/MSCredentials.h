/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSRequest.h"

@protocol MSCredentials

@required	
- (void)prepareRequest:(id<MSRequest>)request;

@end