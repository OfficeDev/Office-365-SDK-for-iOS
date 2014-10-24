/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSAttendeeType.h"
@class MSResponseStatus;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSRecipient.h"

/**
* The header for type Attendee.
*/

@interface MSAttendee : MSRecipient
@property MSResponseStatus *Status;
@property MSAttendeeType *Type;

@end