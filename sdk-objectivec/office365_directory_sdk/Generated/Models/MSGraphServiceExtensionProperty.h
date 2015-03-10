/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/


#import "MSGraphServiceProtocols.h"
#import "MSGraphServiceDirectoryObject.h"
#import <Foundation/Foundation.h>


/**
* The header for type ExtensionProperty.
*/

@interface MSGraphServiceExtensionProperty : MSGraphServiceDirectoryObject

@property NSString *appDisplayName;
@property NSString *name;
@property NSString *dataType;
@property BOOL isSyncedFromOnPremises;
@property NSMutableArray *targetObjects;

@end