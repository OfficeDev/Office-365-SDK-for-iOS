/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type AppRoleAssignment.
*/

@interface MSDirectoryAppRoleAssignment : MSDirectoryDirectoryObject
@property NSDate *creationTimestamp;
@property NSString *id;
@property NSString *principalDisplayName;
@property NSString *principalId;
@property NSString *principalType;
@property NSString *resourceDisplayName;
@property NSString *resourceId;

@end