//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Recipient.h"



@class ResponseType;

@interface ResponseStatus : Recipient	


@property ResponseType *Response;

@property NSDate *Time;


@end