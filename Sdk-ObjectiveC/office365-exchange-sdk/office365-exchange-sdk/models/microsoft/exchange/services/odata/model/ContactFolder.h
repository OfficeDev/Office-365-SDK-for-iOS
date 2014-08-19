//
//  ContactFolder.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface ContactFolder : Entity

@property NSString * ParentFolderId;
@property NSString * DisplayName;
@property NSMutableArray * Contacts;
@property NSMutableArray * ChildFolders;

@end