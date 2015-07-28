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

#import "MSGraphModels.h"

/**
* The implementation file for type MSGraphDeviceConfiguration.
*/

@implementation MSGraphDeviceConfiguration	

@synthesize odataType = _odataType;
@synthesize publicIssuerCertificates = _publicIssuerCertificates;
@synthesize cloudPublicIssuerCertificates = _cloudPublicIssuerCertificates;
@synthesize registrationQuota = _registrationQuota;
@synthesize maximumRegistrationInactivityPeriod = _maximumRegistrationInactivityPeriod;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.Graph.DeviceConfiguration";
		_publicIssuerCertificates = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphBinary"];
		_cloudPublicIssuerCertificates = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphBinary"];
    }

	return self;
}

- (void)setPublicIssuerCertificates:(NSMutableArray *) publicIssuerCertificates {
    _publicIssuerCertificates = publicIssuerCertificates;
	[self valueChanged:publicIssuerCertificates forProperty:@"publicIssuerCertificates"];
}
    
- (void)setCloudPublicIssuerCertificates:(NSMutableArray *) cloudPublicIssuerCertificates {
    _cloudPublicIssuerCertificates = cloudPublicIssuerCertificates;
	[self valueChanged:cloudPublicIssuerCertificates forProperty:@"cloudPublicIssuerCertificates"];
}
    
- (void)setRegistrationQuota:(int ) registrationQuota {
    _registrationQuota = registrationQuota;
    [self valueChangedForInt:registrationQuota forProperty:@"registrationQuota"];
}
    
- (void)setMaximumRegistrationInactivityPeriod:(int ) maximumRegistrationInactivityPeriod {
    _maximumRegistrationInactivityPeriod = maximumRegistrationInactivityPeriod;
    [self valueChangedForInt:maximumRegistrationInactivityPeriod forProperty:@"maximumRegistrationInactivityPeriod"];
}
    
@end