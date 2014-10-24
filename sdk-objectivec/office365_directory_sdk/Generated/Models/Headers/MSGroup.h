/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSProvisioningError;
@class MSAppRoleAssignment;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type Group.
*/

@interface MSGroup : MSDirectoryObject
@property NSString *description;
@property bool dirSyncEnabled;
@property NSString *displayName;
@property NSDate *lastDirSyncTime;
@property NSString *mail;
@property NSString *mailNickname;
@property bool mailEnabled;
@property NSString *onPremisesSecurityIdentifier;
@property NSMutableArray<MSProvisioningError> *provisioningErrors;
@property NSMutableArray *proxyAddresses;
@property bool securityEnabled;

@end