/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookFolderOperations.h"
#import "MSOutlookFolder.h"
@class MSOutlookFolderCollectionFetcher;
@class MSOutlookMessageCollectionFetcher;

/**
* The header for type MSOutlookFolderFetcher.
*/

@protocol MSOutlookFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookFolder* folder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookFolder*, NSError * error))callback;
@end

@interface MSOutlookFolderFetcher : MSOutlookODataEntityFetcher<MSOutlookFolderFetcher>

-(MSOutlookFolderOperations*) getOperations;
-(MSOutlookFolderCollectionFetcher*) getChildFolders;
-(MSOutlookMessageCollectionFetcher*) getMessages;
	
@end