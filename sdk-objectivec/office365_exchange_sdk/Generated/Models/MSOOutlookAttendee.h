/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOOutlookAttendeeType.h"
@class MSOOutlookResponseStatus;

#import <Foundation/Foundation.h>
#import "MSOOutlookProtocols.h"
#import "MSOOutlookRecipient.h"

/**
* The header for type Attendee.
*/

@interface MSOOutlookAttendee : MSOOutlookRecipient


@property MSOOutlookResponseStatus *Status;

@property MSOOutlookAttendeeType *Type;


@end