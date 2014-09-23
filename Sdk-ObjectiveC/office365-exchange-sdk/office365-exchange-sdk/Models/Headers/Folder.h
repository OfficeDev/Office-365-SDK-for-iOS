//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Entity.h"



@class Folder;

@class Message;

@interface Folder : Entity	


-(id<Folder>)getOperations;

@property id<Folder> Operations;

@property NSString *ParentFolderId;

@property NSString *DisplayName;

@property NSString *ClassName;

@property int TotalCount;

@property int ChildFolderCount;

@property int UnreadItemCount;

@property NSMutableArray<Folder> *ChildFolders;

@property NSMutableArray<Message> *Messages;


@end