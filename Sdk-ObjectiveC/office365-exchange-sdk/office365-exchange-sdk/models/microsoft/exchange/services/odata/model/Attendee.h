//
//  Attendee.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recipient.h"
#import "ResponseStatus.h"
#import "AttendeeType.h"

@interface Attendee : Recipient

@property ResponseStatus * Status;
@property enum AttendeeType * Type;

@end