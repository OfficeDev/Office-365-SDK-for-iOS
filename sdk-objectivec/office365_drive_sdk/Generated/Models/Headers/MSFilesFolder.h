/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSFilesItem;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSFilesItem.h"

/**
* The header for type Folder.
*/

@interface MSFilesFolder : MSFilesItem
@property int childCount;

@end