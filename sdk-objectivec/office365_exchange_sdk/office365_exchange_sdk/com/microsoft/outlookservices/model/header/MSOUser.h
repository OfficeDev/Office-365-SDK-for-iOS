/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOFolder;
@class MSOMessage;
@class MSOCalendar;
@class MSOCalendarGroup;
@class MSOEvent;
@class MSOContact;
@class MSOContactFolder;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOEntity.h"

/**
* The header for type User.
*/

@interface MSOUser : MSOEntity
@property NSString *DisplayName;
@property NSString *Alias;
@property NSString *MailboxGuid;

@end