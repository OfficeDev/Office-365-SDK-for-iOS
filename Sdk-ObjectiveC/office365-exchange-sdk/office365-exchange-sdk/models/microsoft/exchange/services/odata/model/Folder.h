//
//  Folder.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface Folder : Entity

@property NSString * ParentFolderId;
@property NSString * DisplayName;
@property NSString * ClassName;
@property int TotalCount;
@property int ChildFolderCount;
@property int UnreadItemCount;
@property NSMutableArray * ChildFolders;
@property NSMutableArray * Messages;

@end