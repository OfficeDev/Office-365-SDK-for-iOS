/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataEntityFetcher.h"
#import "MSFilesFileOperations.h"
#import "MSFilesFile.h"

/**
* The header for type MSFilesFileFetcher.
*/

@protocol MSFilesFileFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSFilesFile* file, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSFilesFile*, NSError * error))callback;
@end

@interface MSFilesFileFetcher : MSFilesODataMediaEntityFetcher<MSFilesFileFetcher>

-(MSFilesFileOperations*) getOperations;
	
@end