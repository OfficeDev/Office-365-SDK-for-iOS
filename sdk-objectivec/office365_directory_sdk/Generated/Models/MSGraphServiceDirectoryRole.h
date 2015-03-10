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

@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;


#import "MSGraphServiceProtocols.h"
#import "MSGraphServiceDirectoryObject.h"
#import <Foundation/Foundation.h>


/**
* The header for type DirectoryRole.
*/

@interface MSGraphServiceDirectoryRole : MSGraphServiceDirectoryObject

@property NSString *$$__description;
@property NSString *displayName;
@property BOOL isSystem;
@property BOOL roleDisabled;
@property NSString *roleTemplateId;
@property NSMutableArray<MSGraphServiceDirectoryObject> *members;
@property NSMutableArray<MSGraphServiceDirectoryObject> *memberOf;
@property NSMutableArray<MSGraphServiceDirectoryObject> *owners;
@property NSMutableArray<MSGraphServiceDirectoryObject> *ownedObjects;

@end