/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSFolder;
@class MSMessage;
@class MSCalendar;
@class MSCalendarGroup;
@class MSEvent;
@class MSContact;
@class MSContactFolder;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSEntity.h"

/**
* The header for type User.
*/

@interface MSUser : MSEntity
@property NSString *DisplayName;
@property NSString *Alias;
@property NSString *MailboxGuid;

@end