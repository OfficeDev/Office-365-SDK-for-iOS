/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSFilesIdentity;
@class MSFilesDriveQuota;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type Drive.
*/

@interface MSFilesDrive : NSObject
@property NSString *id;
@property MSOIdentity *owner;
@property MSODriveQuota *quota;

@end