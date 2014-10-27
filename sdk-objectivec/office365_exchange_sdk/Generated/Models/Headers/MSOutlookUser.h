/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOutlookFolder;
@class MSOutlookMessage;
@class MSOutlookCalendar;
@class MSOutlookCalendarGroup;
@class MSOutlookEvent;
@class MSOutlookContact;
@class MSOutlookContactFolder;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookEntity.h"

/**
* The header for type User.
*/

@interface MSOutlookUser : MSOutlookEntity
@property NSString *DisplayName;
@property NSString *Alias;
@property NSString *MailboxGuid;

@end