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

@class MSDirectoryProvisioningError;

#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type Contact.
*/

@interface MSDirectoryContact : MSDirectoryDirectoryObject


@property NSString *city;

@property NSString *country;

@property NSString *department;

@property bool dirSyncEnabled;

@property NSString *displayName;

@property NSString *facsimileTelephoneNumber;

@property NSString *givenName;

@property NSString *jobTitle;

@property NSDate *lastDirSyncTime;

@property NSString *mail;

@property NSString *mailNickname;

@property NSString *mobile;

@property NSString *physicalDeliveryOfficeName;

@property NSString *postalCode;

@property NSMutableArray<MSDirectoryProvisioningError> *provisioningErrors;

@property NSMutableArray *proxyAddresses;

@property NSString *sipProxyAddress;

@property NSString *state;

@property NSString *streetAddress;

@property NSString *surname;

@property NSString *telephoneNumber;

@property NSStream *thumbnailPhoto;


@end