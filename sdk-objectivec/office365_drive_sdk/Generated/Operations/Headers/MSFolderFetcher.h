/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSFolderOperations.h"
#import "MSFolder.h"
@class MSItemCollectionFetcher;

/**
* The header for type MSFolderFetcher.
*/

@protocol MSFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSFolder* folder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSFolder*, NSError * error))callback;
@end

@interface MSFolderFetcher : MSODataEntityFetcher<MSFolderFetcher>

-(MSFolderOperations*) getOperations;
-(MSItemCollectionFetcher*) getchildren;
	
@end