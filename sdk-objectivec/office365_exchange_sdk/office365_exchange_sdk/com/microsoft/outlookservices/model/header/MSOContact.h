/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOEmailAddress;
@class MSOPhysicalAddress;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOItem.h"

/**
* The header for type Contact.
*/

@interface MSOContact : MSOItem
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
@property NSMutableArray<MSOEmailAddress> *EmailAddresses;
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
@property MSOPhysicalAddress *HomeAddress;
@property MSOPhysicalAddress *BusinessAddress;
@property MSOPhysicalAddress *OtherAddress;
@property NSString *YomiCompanyName;
@property NSString *YomiGivenName;
@property NSString *YomiSurname;

@end