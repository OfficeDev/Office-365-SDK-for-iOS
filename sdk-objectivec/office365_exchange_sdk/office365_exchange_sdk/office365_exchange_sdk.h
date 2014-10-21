//
//  office365_exchange_sdk.h
//  office365_exchange_sdk
//
//  Created by Josh Gavant on 10/19/14.
//  Copyright (c) 2014 Microsoft Open Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for office365_exchange_sdk.
FOUNDATION_EXPORT double office365_exchange_sdkVersionNumber;

//! Project version string for office365_exchange_sdk.
FOUNDATION_EXPORT const unsigned char office365_exchange_sdkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <office365_exchange_sdk/PublicHeader.h>

// Models
/*
#import <office365_exchange_sdk/MSOAttachment.h>
#import <office365_exchange_sdk/MSOAttendee.h>
#import <office365_exchange_sdk/MSOAttendeeType.h>
#import <office365_exchange_sdk/MSOBodyType.h>
#import <office365_exchange_sdk/MSOCalendar.h>
#import <office365_exchange_sdk/MSOCalendarGroup.h>
#import <office365_exchange_sdk/MSOContact.h>
#import <office365_exchange_sdk/MSOContactFolder.h>
#import <office365_exchange_sdk/MSODayOfWeek.h>
#import <office365_exchange_sdk/MSOEmailAddress.h>
#import <office365_exchange_sdk/MSOEntity.h>
#import <office365_exchange_sdk/MSOEvent.h>
#import <office365_exchange_sdk/MSOEventType.h>
#import <office365_exchange_sdk/MSOFileAttachment.h>
#import <office365_exchange_sdk/MSOFolder.h>
#import <office365_exchange_sdk/MSOFreeBusyStatus.h>
#import <office365_exchange_sdk/MSOImportance.h>
#import <office365_exchange_sdk/MSOItem.h>
#import <office365_exchange_sdk/MSOItemAttachment.h>
#import <office365_exchange_sdk/MSOItemBody.h>
#import <office365_exchange_sdk/MSOLocation.h>
#import <office365_exchange_sdk/MSOMeetingMessageType.h>
#import <office365_exchange_sdk/MSOMessage.h>
#import <office365_exchange_sdk/MSOPatternedRecurrence.h>
#import <office365_exchange_sdk/MSOPhysicalAddress.h>
#import <office365_exchange_sdk/MSOProtocols.h>
#import <office365_exchange_sdk/MSORecipient.h>
#import <office365_exchange_sdk/MSORecurrencePattern.h>
#import <office365_exchange_sdk/MSORecurrencePatternType.h>
#import <office365_exchange_sdk/MSORecurrenceRange.h>
#import <office365_exchange_sdk/MSORecurrenceRangeType.h>
#import <office365_exchange_sdk/MSOResponseStatus.h>
#import <office365_exchange_sdk/MSOResponseType.h>
#import <office365_exchange_sdk/MSOUser.h>
#import <office365_exchange_sdk/MSOWeekIndex.h>*/

//Operation
#import <office365_exchange_sdk/MSOAttachmentCollectionFetcher.h>
#import <office365_exchange_sdk/MSOAttachmentCollectionOperations.h>
#import <office365_exchange_sdk/MSOAttachmentFetcher.h>
#import <office365_exchange_sdk/MSOAttachmentOperations.h>
#import <office365_exchange_sdk/MSOBaseODataContainer.h>
#import <office365_exchange_sdk/MSOCalendarCollectionFetcher.h>
#import <office365_exchange_sdk/MSOCalendarCollectionOperations.h>
#import <office365_exchange_sdk/MSOCalendarFetcher.h>
#import <office365_exchange_sdk/MSOCalendarGroupCollectionFetcher.h>
#import <office365_exchange_sdk/MSOCalendarGroupCollectionOperations.h>
#import <office365_exchange_sdk/MSOCalendarGroupFetcher.h>
#import <office365_exchange_sdk/MSOCalendarGroupOperations.h>
#import <office365_exchange_sdk/MSOCalendarOperations.h>
#import <office365_exchange_sdk/MSOContactCollectionFetcher.h>
#import <office365_exchange_sdk/MSOContactCollectionOperations.h>
#import <office365_exchange_sdk/MSOContactFetcher.h>
#import <office365_exchange_sdk/MSOContactFolderCollectionFetcher.h>
#import <office365_exchange_sdk/MSOContactFolderCollectionOperations.h>
#import <office365_exchange_sdk/MSOContactFolderFetcher.h>
#import <office365_exchange_sdk/MSOContactFolderOperations.h>
#import <office365_exchange_sdk/MSOContactOperations.h>
#import <office365_exchange_sdk/MSOEntityCollectionFetcher.h>
#import <office365_exchange_sdk/MSOEntityCollectionOperations.h>
#import <office365_exchange_sdk/MSOEntityContainerClient.h>
#import <office365_exchange_sdk/MSOEntityFetcher.h>
#import <office365_exchange_sdk/MSOEntityOperations.h>
#import <office365_exchange_sdk/MSOEventCollectionFetcher.h>
#import <office365_exchange_sdk/MSOEventCollectionOperations.h>
#import <office365_exchange_sdk/MSOEventFetcher.h>
#import <office365_exchange_sdk/MSOEventOperations.h>
#import <office365_exchange_sdk/MSOFileAttachmentCollectionFetcher.h>
#import <office365_exchange_sdk/MSOFileAttachmentCollectionOperations.h>
#import <office365_exchange_sdk/MSOFileAttachmentFetcher.h>
#import <office365_exchange_sdk/MSOFileAttachmentOperations.h>
#import <office365_exchange_sdk/MSOFolderCollectionFetcher.h>
#import <office365_exchange_sdk/MSOFolderCollectionOperations.h>
#import <office365_exchange_sdk/MSOFolderFetcher.h>
#import <office365_exchange_sdk/MSOFolderOperations.h>
#import <office365_exchange_sdk/MSOItemAttachmentCollectionFetcher.h>
#import <office365_exchange_sdk/MSOItemAttachmentCollectionOperations.h>
#import <office365_exchange_sdk/MSOItemAttachmentFetcher.h>
#import <office365_exchange_sdk/MSOItemAttachmentOperations.h>
#import <office365_exchange_sdk/MSOItemCollectionFetcher.h>
#import <office365_exchange_sdk/MSOItemCollectionOperations.h>
#import <office365_exchange_sdk/MSOItemFetcher.h>
#import <office365_exchange_sdk/MSOItemOperations.h>
#import <office365_exchange_sdk/MSOMessageCollectionFetcher.h>
#import <office365_exchange_sdk/MSOMessageCollectionOperations.h>
#import <office365_exchange_sdk/MSOMessageFetcher.h>
#import <office365_exchange_sdk/MSOMessageOperations.h>
#import <office365_exchange_sdk/MSOODataCollectionFetcher.h>
#import <office365_exchange_sdk/MSOODataEntityFetcher.h>
#import <office365_exchange_sdk/MSOODataExecutable.h>
#import <office365_exchange_sdk/MSOODataOperations.h>
#import <office365_exchange_sdk/MSOUserCollectionFetcher.h>
#import <office365_exchange_sdk/MSOUserCollectionOperations.h>
#import <office365_exchange_sdk/MSOUserFetcher.h>
#import <office365_exchange_sdk/MSOUserOperations.h>