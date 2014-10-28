/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type DirectoryRole.
*/

@interface MSDirectoryDirectoryRole : MSDirectoryDirectoryObject

@property NSString *$$__description;
@property NSString *displayName;
@property bool isSystem;
@property bool roleDisabled;
@property NSString *roleTemplateId;

@end