/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type DriveQuota.
*/

@interface MSFilesDriveQuota : NSObject

@property int deleted;
@property int remaining;
@property NSString *state;
@property int total;

@end