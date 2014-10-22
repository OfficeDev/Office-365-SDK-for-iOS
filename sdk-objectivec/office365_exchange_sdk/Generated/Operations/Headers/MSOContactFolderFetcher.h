/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOContactFolderOperations.h"
#import "MSOContactFolder.h"
@class MSOContactCollectionFetcher;
@class MSOContactFolderCollectionFetcher;

/**
* The header for type MSOContactFolderFetcher.
*/


@protocol MSOContactFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOContactFolder* contactFolder, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOContactFolder*, NSError * error))callback;
@end

@interface MSOContactFolderFetcher : MSOODataEntityFetcher<MSOContactFolderFetcher>

-(MSOContactFolderOperations*) getOperations;

-(MSOContactCollectionFetcher*) getContacts;
-(MSOContactFolderCollectionFetcher*) getChildFolders;
@end