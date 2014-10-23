/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSItem;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSItem.h"

/**
* The header for type Folder.
*/

@interface MSFolder : MSItem
@property int childCount;

@end