/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Item.h"
@class EmailAddress;
//@class PhysicalAddress;


@interface Contact : Item	

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
@property NSMutableArray<EmailAddress> *EmailAddresses;
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
@property PhysicalAddress *HomeAddress;
@property PhysicalAddress *BusinessAddress;
@property PhysicalAddress *OtherAddress;
@property NSString *YomiCompanyName;
@property NSString *YomiGivenName;
@property NSString *YomiSurname;

@end