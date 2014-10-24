/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSAlternativeSecurityId;
@class MSDirectoryObject;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type Device.
*/

@interface MSDevice : MSDirectoryObject
@property bool accountEnabled;
@property NSMutableArray<MSAlternativeSecurityId> *alternativeSecurityIds;
@property NSDate *approximateLastLogonTimestamp;
@property NSString *deviceId;
@property NSString *deviceMetadata;
@property int deviceObjectVersion;
@property NSString *deviceOSType;
@property NSString *deviceOSVersion;
@property NSMutableArray *devicePhysicalIds;
@property NSString *deviceTrustType;
@property bool dirSyncEnabled;
@property NSString *displayName;
@property NSDate *lastDirSyncTime;

@end