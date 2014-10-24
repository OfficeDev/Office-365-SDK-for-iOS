/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type AppRoleAssignment.
*/

@interface MSAppRoleAssignment : MSDirectoryObject
@property NSDate *creationTimestamp;
@property NSString *id;
@property NSString *principalDisplayName;
@property NSString *principalId;
@property NSString *principalType;
@property NSString *resourceDisplayName;
@property NSString *resourceId;

@end