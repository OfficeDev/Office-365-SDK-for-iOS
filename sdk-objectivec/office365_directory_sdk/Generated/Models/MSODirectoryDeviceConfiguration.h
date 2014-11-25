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


#import <Foundation/Foundation.h>
#import "MSODirectoryProtocols.h"
#import "MSODirectoryDirectoryObject.h"

/**
* The header for type DeviceConfiguration.
*/

@interface MSODirectoryDeviceConfiguration : MSODirectoryDirectoryObject


@property NSMutableArray* publicIssuerCertificates;

@property NSMutableArray* cloudPublicIssuerCertificates;

@property int registrationQuota;

@property int maximumRegistrationInactivityPeriod;


@end