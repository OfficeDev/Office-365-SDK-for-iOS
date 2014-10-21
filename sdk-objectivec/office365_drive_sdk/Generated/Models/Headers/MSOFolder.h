/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOItem;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOItem.h"

/**
* The header for type Folder.
*/

@interface MSOFolder : MSOItem
@property int childCount;

@end