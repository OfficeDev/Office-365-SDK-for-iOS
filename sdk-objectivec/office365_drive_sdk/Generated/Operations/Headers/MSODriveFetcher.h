/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSODriveOperations.h"
#import "MSODrive.h"

/**
* The header for type MSODriveFetcher.
*/


@protocol MSODriveFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSODrive* drive, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSODrive*, NSError * error))callback;
@end

@interface MSODriveFetcher : MSOODataEntityFetcher<MSODriveFetcher>

-(MSODriveOperations*) getOperations;

@end