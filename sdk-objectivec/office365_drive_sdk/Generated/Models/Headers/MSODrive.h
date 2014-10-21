/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOIdentity;
@class MSODriveQuota;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type Drive.
*/

@interface MSODrive : NSObject
@property NSString *id;
@property MSOIdentity *owner;
@property MSODriveQuota *quota;

@end