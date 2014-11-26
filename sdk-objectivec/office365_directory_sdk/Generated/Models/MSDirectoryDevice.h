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

@class MSDirectoryAlternativeSecurityId;
@class MSDirectoryDirectoryObject;

#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type Device.
*/

@interface MSDirectoryDevice : MSDirectoryDirectoryObject


@property bool accountEnabled;

@property NSMutableArray<MSDirectoryAlternativeSecurityId> *alternativeSecurityIds;

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