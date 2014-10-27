/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookAttendeeType.h"
@class MSOutlookResponseStatus;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookRecipient.h"

/**
* The header for type Attendee.
*/

@interface MSOutlookAttendee : MSOutlookRecipient

@property MSOutlookResponseStatus *Status;
@property MSOutlookAttendeeType *Type;

@end