/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOResponseType.h"

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type ResponseStatus.
*/

@interface MSOResponseStatus : NSObject

@property MSOResponseType *Response;
@property NSDate *Time;

@end