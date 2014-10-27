/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataEntityFetcher.h"
#import "MSSharePointFileOperations.h"
#import "MSSharePointFile.h"
#import "MSSharePointODataMediaEntityFetcher.h"

/**
* The header for type MSSharePointFileFetcher.
*/

@protocol MSSharePointFileFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSSharePointFile* file, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSSharePointFile*, NSError * error))callback;
@end

@interface MSSharePointFileFetcher : MSSharePointODataMediaEntityFetcher<MSSharePointFileFetcher>

-(MSSharePointFileOperations*) getOperations;
	
@end