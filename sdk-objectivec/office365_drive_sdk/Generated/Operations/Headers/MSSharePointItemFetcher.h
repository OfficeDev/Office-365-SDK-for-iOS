/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataEntityFetcher.h"
#import "MSSharePointItemOperations.h"
#import "MSSharePointItem.h"

#import "MSSharePointFileFetcher.h"	
#import "MSSharePointFolderFetcher.h"	
/**
* The header for type MSSharePointItemFetcher.
*/

@protocol MSSharePointItemFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSSharePointItem* item, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSSharePointItem*, NSError * error))callback;
@end

@interface MSSharePointItemFetcher : MSSharePointODataEntityFetcher<MSSharePointItemFetcher>

-(MSSharePointItemOperations*) getOperations;
		
-(MSSharePointFileFetcher*) asFile;	
		
-(MSSharePointFolderFetcher*) asFolder;	
	
@end