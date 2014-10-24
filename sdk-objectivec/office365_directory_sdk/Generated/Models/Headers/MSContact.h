/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSProvisioningError;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type Contact.
*/

@interface MSContact : MSDirectoryObject
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
@property NSMutableArray<MSProvisioningError> *provisioningErrors;
@property NSMutableArray *proxyAddresses;
@property NSString *sipProxyAddress;
@property NSString *state;
@property NSString *streetAddress;
@property NSString *surname;
@property NSString *telephoneNumber;
@property NSStream *thumbnailPhoto;

@end