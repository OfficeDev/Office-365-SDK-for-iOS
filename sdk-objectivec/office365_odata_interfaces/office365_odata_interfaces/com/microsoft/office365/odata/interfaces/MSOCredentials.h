/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSORequest.h"

@protocol MSOCredentials

@required	
- (void)prepareRequest:(id<MSORequest>)request;

@end