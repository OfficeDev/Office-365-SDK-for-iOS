/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSDirectoryDirectoryObject;

#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"


/**
* The header for type DirectoryObject.
*/

@interface MSDirectoryDirectoryObject : NSObject
@property NSString *$$__ODataType;
@property NSString *objectType;
@property NSString *objectId;
@property NSDate *deletionTimestamp;

@end