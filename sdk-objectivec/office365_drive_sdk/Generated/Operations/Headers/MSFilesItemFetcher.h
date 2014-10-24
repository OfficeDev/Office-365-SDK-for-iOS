/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataEntityFetcher.h"
#import "MSFilesItemOperations.h"
#import "MSFilesItem.h"

#import "MSFilesFileFetcher.h"	
#import "MSFilesFolderFetcher.h"	
/**
* The header for type MSFilesItemFetcher.
*/

@protocol MSFilesItemFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSFilesItem* item, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSFilesItem*, NSError * error))callback;
@end

@interface MSFilesItemFetcher : MSFilesODataEntityFetcher<MSFilesItemFetcher>

-(MSFilesItemOperations*) getOperations;
		
-(MSFilesFileFetcher*) asFile;	
		
-(MSFilesFolderFetcher*) asFolder;	
	
@end