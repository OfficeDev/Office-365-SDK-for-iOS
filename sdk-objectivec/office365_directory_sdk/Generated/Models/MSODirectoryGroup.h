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

@class MSODirectoryProvisioningError;
@class MSODirectoryAppRoleAssignment;

#import <Foundation/Foundation.h>
#import "MSODirectoryProtocols.h"
#import "MSODirectoryDirectoryObject.h"

/**
* The header for type Group.
*/

@interface MSODirectoryGroup : MSODirectoryDirectoryObject


@property NSString *description;

@property bool dirSyncEnabled;

@property NSString *displayName;

@property NSDate *lastDirSyncTime;

@property NSString *mail;

@property NSString *mailNickname;

@property bool mailEnabled;

@property NSString *onPremisesSecurityIdentifier;

@property NSMutableArray<MSODirectoryProvisioningError> *provisioningErrors;

@property NSMutableArray *proxyAddresses;

@property bool securityEnabled;


@end