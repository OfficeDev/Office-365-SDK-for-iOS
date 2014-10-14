/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOFolder;
@class MSOMessage;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOEntity.h"

@interface MSOFolder : MSOEntity
@property NSString *ParentFolderId;
@property NSString *DisplayName;
@property int ChildFolderCount;

@end