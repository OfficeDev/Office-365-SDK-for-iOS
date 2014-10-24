/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSDriveOperations.h"
#import "MSDrive.h"

/**
* The header for type MSDriveFetcher.
*/

@protocol MSDriveFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDrive* drive, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDrive*, NSError * error))callback;
@end

@interface MSDriveFetcher : MSODataEntityFetcher<MSDriveFetcher>

-(MSDriveOperations*) getOperations;
	
@end