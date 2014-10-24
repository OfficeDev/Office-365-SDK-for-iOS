/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSDirectoryObject;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type DirectoryObject.
*/

@interface MSDirectoryObject : NSObject
@property NSString *$$__ODataType;
@property NSString *objectType;
@property NSString *objectId;
@property NSDate *deletionTimestamp;

@end