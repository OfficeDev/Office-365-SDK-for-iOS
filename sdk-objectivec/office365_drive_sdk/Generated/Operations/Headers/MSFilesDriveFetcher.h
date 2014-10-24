/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataEntityFetcher.h"
#import "MSFilesDriveOperations.h"
#import "MSFilesDrive.h"

/**
* The header for type MSFilesDriveFetcher.
*/

@protocol MSFilesDriveFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSFilesDrive* drive, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSFilesDrive*, NSError * error))callback;
@end

@interface MSFilesDriveFetcher : MSFilesODataEntityFetcher<MSFilesDriveFetcher>

-(MSFilesDriveOperations*) getOperations;
	
@end