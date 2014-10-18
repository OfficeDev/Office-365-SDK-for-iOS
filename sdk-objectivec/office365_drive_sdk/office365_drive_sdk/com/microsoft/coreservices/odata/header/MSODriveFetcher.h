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

@interface MSODriveFetcher : MSOODataEntityFetcher

-(MSODriveOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSODrive* drive, NSError *error))callback;

@end