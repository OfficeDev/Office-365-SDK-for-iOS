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

@class MSGraphServiceEmailAddress;
@class MSGraphServiceStatus;


#import "MSGraphServiceProtocols.h"

#import <Foundation/Foundation.h>


/**
* The header for type Attendees.
*/

@interface MSGraphServiceAttendees : NSObject

@property NSString *$$__ODataType;
@property MSGraphServiceEmailAddress *EmailAddress;
@property MSGraphServiceStatus *Status;
@property NSString *Type;

@end