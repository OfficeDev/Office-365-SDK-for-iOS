/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Recipient.h"
@class ResponseStatus;
@class AttendeeType;


@interface Attendee : Recipient	

@property ResponseStatus *Status;
@property AttendeeType *Type;

@end