/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Entity.h"
@class Folder;
@class Message;


@interface Folder : Entity	

@property NSString *ParentFolderId;
@property NSString *DisplayName;
@property int ChildFolderCount;

@end