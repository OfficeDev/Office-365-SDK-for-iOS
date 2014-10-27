/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


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