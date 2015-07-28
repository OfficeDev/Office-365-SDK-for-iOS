/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/

@class MSGraphProvisioningError;
@class NSStream;
@class MSGraphDirectoryObject;

#import <Foundation/Foundation.h>
#import "MSGraphDirectoryObject.h"

/**
* The header for type Contact.
*/

@interface MSGraphContact : MSGraphDirectoryObject

@property (copy, nonatomic, readwrite, getter=city, setter=setCity:) NSString *city;
@property (copy, nonatomic, readwrite, getter=country, setter=setCountry:) NSString *country;
@property (copy, nonatomic, readwrite, getter=department, setter=setDepartment:) NSString *department;
@property (nonatomic, getter=dirSyncEnabled, setter=setDirSyncEnabled:) BOOL dirSyncEnabled;
@property (copy, nonatomic, readwrite, getter=displayName, setter=setDisplayName:) NSString *displayName;
@property (copy, nonatomic, readwrite, getter=facsimileTelephoneNumber, setter=setFacsimileTelephoneNumber:) NSString *facsimileTelephoneNumber;
@property (copy, nonatomic, readwrite, getter=givenName, setter=setGivenName:) NSString *givenName;
@property (copy, nonatomic, readwrite, getter=jobTitle, setter=setJobTitle:) NSString *jobTitle;
@property (copy, nonatomic, readwrite, getter=lastDirSyncTime, setter=setLastDirSyncTime:) NSDate *lastDirSyncTime;
@property (copy, nonatomic, readwrite, getter=mail, setter=setMail:) NSString *mail;
@property (copy, nonatomic, readwrite, getter=mailNickname, setter=setMailNickname:) NSString *mailNickname;
@property (copy, nonatomic, readwrite, getter=mobile, setter=setMobile:) NSString *mobile;
@property (copy, nonatomic, readwrite, getter=physicalDeliveryOfficeName, setter=setPhysicalDeliveryOfficeName:) NSString *physicalDeliveryOfficeName;
@property (copy, nonatomic, readwrite, getter=postalCode, setter=setPostalCode:) NSString *postalCode;
@property (copy, nonatomic, readwrite, getter=provisioningErrors, setter=setProvisioningErrors:) NSMutableArray *provisioningErrors;
@property (copy, nonatomic, readwrite, getter=proxyAddresses, setter=setProxyAddresses:) NSMutableArray *proxyAddresses;
@property (copy, nonatomic, readwrite, getter=sipProxyAddress, setter=setSipProxyAddress:) NSString *sipProxyAddress;
@property (copy, nonatomic, readwrite, getter=state, setter=setState:) NSString *state;
@property (copy, nonatomic, readwrite, getter=streetAddress, setter=setStreetAddress:) NSString *streetAddress;
@property (copy, nonatomic, readwrite, getter=surname, setter=setSurname:) NSString *surname;
@property (copy, nonatomic, readwrite, getter=telephoneNumber, setter=setTelephoneNumber:) NSString *telephoneNumber;
@property (copy, nonatomic, readwrite, getter=thumbnailPhoto, setter=setThumbnailPhoto:) NSStream *thumbnailPhoto;
@property (copy, nonatomic, readwrite, getter=manager, setter=setManager:) MSGraphDirectoryObject *manager;
@property (copy, nonatomic, readwrite, getter=directReports, setter=setDirectReports:) NSMutableArray *directReports;
@property (copy, nonatomic, readwrite, getter=memberOf, setter=setMemberOf:) NSMutableArray *memberOf;

@end