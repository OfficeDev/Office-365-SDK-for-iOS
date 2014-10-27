/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataEntityFetcher.h"
#import "MSSharePointDriveOperations.h"
#import "MSSharePointDrive.h"

/**
* The header for type MSSharePointDriveFetcher.
*/

@protocol MSSharePointDriveFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSSharePointDrive* drive, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSSharePointDrive*, NSError * error))callback;
@end

@interface MSSharePointDriveFetcher : MSSharePointODataEntityFetcher<MSSharePointDriveFetcher>

-(MSSharePointDriveOperations*) getOperations;
	
@end