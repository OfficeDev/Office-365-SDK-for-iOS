//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Recipient.h"



@class ResponseStatus;

@class AttendeeType;

@interface Attendee : Recipient	


@property ResponseStatus *Status;

@property AttendeeType *Type;


@end