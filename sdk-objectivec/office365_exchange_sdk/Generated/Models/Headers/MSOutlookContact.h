/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOutlookEmailAddress;
@class MSOutlookPhysicalAddress;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookItem.h"

/**
* The header for type Contact.
*/

@interface MSOutlookContact : MSOutlookItem
@property NSString *ParentFolderId;
@property NSDate *Birthday;
@property NSString *FileAs;
@property NSString *DisplayName;
@property NSString *GivenName;
@property NSString *Initials;
@property NSString *MiddleName;
@property NSString *NickName;
@property NSString *Surname;
@property NSString *Title;
@property NSString *Generation;
@property NSMutableArray<MSOutlookEmailAddress> *EmailAddresses;
@property NSMutableArray *ImAddresses;
@property NSString *JobTitle;
@property NSString *CompanyName;
@property NSString *Department;
@property NSString *OfficeLocation;
@property NSString *Profession;
@property NSString *BusinessHomePage;
@property NSString *AssistantName;
@property NSString *Manager;
@property NSMutableArray *HomePhones;
@property NSMutableArray *BusinessPhones;
@property NSString *MobilePhone1;
@property MSOutlookPhysicalAddress *HomeAddress;
@property MSOutlookPhysicalAddress *BusinessAddress;
@property MSOutlookPhysicalAddress *OtherAddress;
@property NSString *YomiCompanyName;
@property NSString *YomiGivenName;
@property NSString *YomiSurname;

@end