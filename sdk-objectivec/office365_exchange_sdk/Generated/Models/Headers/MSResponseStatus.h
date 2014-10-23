/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSResponseType.h"

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type ResponseStatus.
*/

@interface MSResponseStatus : NSObject

@property MSResponseType *Response;
@property NSDate *Time;

@end