/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type DeviceConfiguration.
*/

@interface MSDirectoryDeviceConfiguration : MSDirectoryDirectoryObject
@property NSMutableArray *publicIssuerCertificates;
@property NSMutableArray *cloudPublicIssuerCertificates;
@property int registrationQuota;
@property int maximumRegistrationInactivityPeriod;

@end