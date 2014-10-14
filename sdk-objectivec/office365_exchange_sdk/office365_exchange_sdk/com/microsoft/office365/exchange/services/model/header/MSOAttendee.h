/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOResponseStatus;
#import "MSOAttendeeType.h"

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSORecipient.h"

@interface MSOAttendee : MSORecipient
@property MSOResponseStatus *Status;
@property MSOAttendeeType *Type;

@end