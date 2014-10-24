/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataEntityFetcher.h"
#import "MSFilesFolderOperations.h"
#import "MSFilesFolder.h"
@class MSFilesItemCollectionFetcher;

/**
* The header for type MSFilesFolderFetcher.
*/

@protocol MSFilesFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSFilesFolder* folder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSFilesFolder*, NSError * error))callback;
@end

@interface MSFilesFolderFetcher : MSFilesODataEntityFetcher<MSFilesFolderFetcher>

-(MSFilesFolderOperations*) getOperations;
-(MSFilesItemCollectionFetcher*) getchildren;
	
@end