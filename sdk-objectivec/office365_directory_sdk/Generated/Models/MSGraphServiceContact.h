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

@class MSGraphServiceProvisioningError;
@class NSStream;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;


#import "MSGraphServiceProtocols.h"
#import "MSGraphServiceDirectoryObject.h"
#import <Foundation/Foundation.h>


/**
* The header for type Contact.
*/

@interface MSGraphServiceContact : MSGraphServiceDirectoryObject

@property NSString *city;
@property NSString *country;
@property NSString *department;
@property BOOL dirSyncEnabled;
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
@property NSMutableArray<MSGraphServiceProvisioningError> *provisioningErrors;
@property NSMutableArray *proxyAddresses;
@property NSString *sipProxyAddress;
@property NSString *state;
@property NSString *streetAddress;
@property NSString *surname;
@property NSString *telephoneNumber;
@property NSStream *thumbnailPhoto;
@property MSGraphServiceDirectoryObject *manager;
@property NSMutableArray<MSGraphServiceDirectoryObject> *directReports;
@property NSMutableArray<MSGraphServiceDirectoryObject> *memberOf;

@end