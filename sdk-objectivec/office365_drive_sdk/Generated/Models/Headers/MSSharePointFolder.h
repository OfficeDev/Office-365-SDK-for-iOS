/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSSharePointItem;

#import <Foundation/Foundation.h>
#import "MSSharePointProtocols.h"
#import "MSSharePointItem.h"

/**
* The header for type Folder.
*/

@interface MSSharePointFolder : MSSharePointItem
@property int childCount;

@end