/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSItemOperations.h"
#import "MSItem.h"

#import "MSFileFetcher.h"	
#import "MSFolderFetcher.h"	
/**
* The header for type MSItemFetcher.
*/

@protocol MSItemFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSItem* item, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSItem*, NSError * error))callback;
@end

@interface MSItemFetcher : MSODataEntityFetcher<MSItemFetcher>

-(MSItemOperations*) getOperations;
		
-(MSFileFetcher*) asFile;	
		
-(MSFolderFetcher*) asFolder;	
	
@end