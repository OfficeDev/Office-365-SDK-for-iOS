/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookContactFolderOperations.h"
#import "MSOutlookContactFolder.h"
@class MSOutlookContactCollectionFetcher;
@class MSOutlookContactFolderCollectionFetcher;

/**
* The header for type MSOutlookContactFolderFetcher.
*/

@protocol MSOutlookContactFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookContactFolder* contactFolder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookContactFolder*, NSError * error))callback;
@end

@interface MSOutlookContactFolderFetcher : MSOutlookODataEntityFetcher<MSOutlookContactFolderFetcher>

-(MSOutlookContactFolderOperations*) getOperations;
-(MSOutlookContactCollectionFetcher*) getContacts;
-(MSOutlookContactFolderCollectionFetcher*) getChildFolders;
	
@end