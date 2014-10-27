/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataEntityFetcher.h"
#import "MSSharePointFolderOperations.h"
#import "MSSharePointFolder.h"
@class MSSharePointItemCollectionFetcher;

/**
* The header for type MSSharePointFolderFetcher.
*/

@protocol MSSharePointFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSSharePointFolder* folder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSSharePointFolder*, NSError * error))callback;
@end

@interface MSSharePointFolderFetcher : MSSharePointODataEntityFetcher<MSSharePointFolderFetcher>

-(MSSharePointFolderOperations*) getOperations;
-(MSSharePointItemCollectionFetcher*) getchildren;
	
@end