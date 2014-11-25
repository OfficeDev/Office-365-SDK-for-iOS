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

#import <office365_odata_base/office365_odata_base.h>
#import "MSOSharePointDriveOperations.h"
#import "MSOSharePointDrive.h"


/**
* The header for type MSOSharePointDriveFetcher.
*/

@protocol MSOSharePointDriveFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOSharePointDrive* drive, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOSharePointDrive*, NSError * error))callback;
@end

@interface MSOSharePointDriveFetcher : MSODataEntityFetcher<MSOSharePointDriveFetcher>

-(MSOSharePointDriveOperations*) getOperations;

	
@end