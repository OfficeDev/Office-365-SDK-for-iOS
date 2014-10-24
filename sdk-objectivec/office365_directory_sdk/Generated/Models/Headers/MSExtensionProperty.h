/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type ExtensionProperty.
*/

@interface MSExtensionProperty : MSDirectoryObject
@property NSString *appDisplayName;
@property NSString *name;
@property NSString *dataType;
@property bool isSyncedFromOnPremises;
@property NSMutableArray *targetObjects;

@end