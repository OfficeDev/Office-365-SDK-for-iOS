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
#import "MSDirectoryModels.h"

/**
* The implementation file for type LicenseUnitsDetail.
*/

@implementation MSDirectoryLicenseUnitsDetail	

@synthesize odataType = _odataType;
@synthesize enabled = _enabled;
@synthesize suspended = _suspended;
@synthesize warning = _warning;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.DirectoryServices.LicenseUnitsDetail";
	}

	return self;
}

- (void)setEnabled:(int ) enabled {
    _enabled = enabled;
    [self valueChangedForInt:enabled forProperty:@"enabled"];
}
    
- (void)setSuspended:(int ) suspended {
    _suspended = suspended;
    [self valueChangedForInt:suspended forProperty:@"suspended"];
}
    
- (void)setWarning:(int ) warning {
    _warning = warning;
    [self valueChangedForInt:warning forProperty:@"warning"];
}
    
@end