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

@class MSOOutlookEmailAddress;
@class MSOOutlookPhysicalAddress;

#import <Foundation/Foundation.h>
#import "MSOOutlookProtocols.h"
#import "MSOOutlookItem.h"

/**
* The header for type Contact.
*/

@interface MSOOutlookContact : MSOOutlookItem


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

@property NSMutableArray<MSOOutlookEmailAddress> *EmailAddresses;

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

@property MSOOutlookPhysicalAddress *HomeAddress;

@property MSOOutlookPhysicalAddress *BusinessAddress;

@property MSOOutlookPhysicalAddress *OtherAddress;

@property NSString *YomiCompanyName;

@property NSString *YomiGivenName;

@property NSString *YomiSurname;


@end