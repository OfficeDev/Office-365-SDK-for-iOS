//
//  ResponseStatus.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recipient.h"
#import "ResponseType.h"

@interface ResponseStatus : Recipient

@property enum ResponseType * Response;
@property NSDate * Time;

@end