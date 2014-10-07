/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Recipient.h"
@class ResponseType;


@interface ResponseStatus : Recipient	

@property ResponseType *Response;
@property NSDate *Time;

@end