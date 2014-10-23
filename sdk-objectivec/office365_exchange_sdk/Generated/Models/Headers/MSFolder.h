/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSFolder;
@class MSMessage;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSEntity.h"

/**
* The header for type Folder.
*/

@interface MSFolder : MSEntity
@property NSString *ParentFolderId;
@property NSString *DisplayName;
@property int ChildFolderCount;

@end