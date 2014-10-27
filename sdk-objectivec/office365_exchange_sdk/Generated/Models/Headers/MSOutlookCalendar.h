/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOutlookEvent;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookEntity.h"

/**
* The header for type Calendar.
*/

@interface MSOutlookCalendar : MSOutlookEntity
@property NSString *Name;
@property NSString *ChangeKey;

@end