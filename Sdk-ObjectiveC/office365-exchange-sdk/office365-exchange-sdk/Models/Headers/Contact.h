//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Item.h"



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

@property NSString *EmailAddress1;

@property NSString *EmailAddress2;

@property NSString *EmailAddress3;

@property NSString *ImAddress1;

@property NSString *ImAddress2;

@property NSString *ImAddress3;

@property NSString *JobTitle;

@property NSString *CompanyName;

@property NSString *Department;

@property NSString *OfficeLocation;

@property NSString *Profession;

@property NSString *BusinessHomePage;

@property NSString *AssistantName;

@property NSString *Manager;

@property NSString *HomePhone1;

@property NSString *HomePhone2;

@property NSString *BusinessPhone1;

@property NSString *BusinessPhone2;

@property NSString *MobilePhone1;

@property NSString *OtherPhone;

@property NSDate *DateTimeCreated;

@property NSDate *LastModifiedTime;


@end