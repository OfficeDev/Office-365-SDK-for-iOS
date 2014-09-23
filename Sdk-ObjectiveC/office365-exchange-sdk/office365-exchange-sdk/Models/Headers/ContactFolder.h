//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Entity.h"



@class Contact;

@class ContactFolder;

@interface ContactFolder : Entity	


@property NSString *ParentFolderId;

@property NSString *DisplayName;

@property NSMutableArray<Contact> *Contacts;

@property NSMutableArray<ContactFolder> *ChildFolders;


@end