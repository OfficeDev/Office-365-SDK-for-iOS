/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAttendeeType.h"
@class MSOResponseStatus;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSORecipient.h"

/**
* The header for type Attendee.
*/

@interface MSOAttendee : MSORecipient

@property MSOResponseStatus *Status;
@property MSOAttendeeType *Type;

@end