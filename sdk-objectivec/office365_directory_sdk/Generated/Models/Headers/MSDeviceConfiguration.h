/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type DeviceConfiguration.
*/

@interface MSDeviceConfiguration : MSDirectoryObject
@property NSMutableArray *publicIssuerCertificates;
@property NSMutableArray *cloudPublicIssuerCertificates;
@property int registrationQuota;
@property int maximumRegistrationInactivityPeriod;

@end