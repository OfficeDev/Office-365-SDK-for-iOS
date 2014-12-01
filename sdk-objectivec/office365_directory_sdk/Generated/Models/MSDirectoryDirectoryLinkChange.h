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


#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type DirectoryLinkChange.
*/

@interface MSDirectoryDirectoryLinkChange : MSDirectoryDirectoryObject


@property NSString *associationType;

@property NSString *sourceObjectId;

@property NSString *sourceObjectType;

@property NSString *sourceObjectUri;

@property NSString *targetObjectId;

@property NSString *targetObjectType;

@property NSString *targetObjectUri;


@end