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

@class MSOOutlookFolder;
@class MSOOutlookMessage;
@class MSOOutlookCalendar;
@class MSOOutlookCalendarGroup;
@class MSOOutlookEvent;
@class MSOOutlookContact;
@class MSOOutlookContactFolder;

#import <Foundation/Foundation.h>
#import "MSOOutlookProtocols.h"
#import "MSOOutlookEntity.h"

/**
* The header for type User.
*/

@interface MSOOutlookUser : MSOOutlookEntity


@property NSString *DisplayName;

@property NSString *Alias;

@property NSString *MailboxGuid;


@end