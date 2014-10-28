/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSDirectoryProvisioningError;
@class MSDirectoryAppRoleAssignment;

#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type Group.
*/

@interface MSDirectoryGroup : MSDirectoryDirectoryObject
@property NSString *$$__description;
@property bool dirSyncEnabled;
@property NSString *displayName;
@property NSDate *lastDirSyncTime;
@property NSString *mail;
@property NSString *mailNickname;
@property bool mailEnabled;
@property NSString *onPremisesSecurityIdentifier;
@property NSMutableArray<MSDirectoryProvisioningError> *provisioningErrors;
@property NSMutableArray *proxyAddresses;
@property bool securityEnabled;

@end