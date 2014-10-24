/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type DirectoryLinkChange.
*/

@interface MSDirectoryLinkChange : MSDirectoryObject
@property NSString *associationType;
@property NSString *sourceObjectId;
@property NSString *sourceObjectType;
@property NSString *sourceObjectUri;
@property NSString *targetObjectId;
@property NSString *targetObjectType;
@property NSString *targetObjectUri;

@end