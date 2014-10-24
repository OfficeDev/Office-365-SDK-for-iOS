/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type DriveQuota.
*/

@interface MSDriveQuota : NSObject
@property NSString *$$__ODataType;
@property int deleted;
@property int remaining;
@property NSString *state;
@property int total;

@end