/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOutlookFolder;
@class MSOutlookMessage;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookEntity.h"

/**
* The header for type Folder.
*/

@interface MSOutlookFolder : MSOutlookEntity
@property NSString *ParentFolderId;
@property NSString *DisplayName;
@property int ChildFolderCount;

@end