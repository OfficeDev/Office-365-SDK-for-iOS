/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Entity.h"
@class Contact;
@class ContactFolder;


@interface ContactFolder : Entity	

@property NSString *ParentFolderId;
@property NSString *DisplayName;

@end