/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSContactFolderOperations.h"
#import "MSContactFolder.h"
@class MSContactCollectionFetcher;
@class MSContactFolderCollectionFetcher;

/**
* The header for type MSContactFolderFetcher.
*/

@protocol MSContactFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSContactFolder* contactFolder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSContactFolder*, NSError * error))callback;
@end

@interface MSContactFolderFetcher : MSODataEntityFetcher<MSContactFolderFetcher>

-(MSContactFolderOperations*) getOperations;
-(MSContactCollectionFetcher*) getContacts;
-(MSContactFolderCollectionFetcher*) getChildFolders;
	
@end