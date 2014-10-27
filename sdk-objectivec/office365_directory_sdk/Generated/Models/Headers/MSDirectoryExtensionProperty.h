/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type ExtensionProperty.
*/

@interface MSDirectoryExtensionProperty : MSDirectoryDirectoryObject
@property NSString *appDisplayName;
@property NSString *name;
@property NSString *dataType;
@property bool isSyncedFromOnPremises;
@property NSMutableArray *targetObjects;

@end