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

@interface MSOContactFolderFetcher : MSOODataEntityFetcher

-(MSOContactFolderOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOContactFolder* contactFolder, NSError *error))callback;

-(MSOContactCollectionFetcher*) getContacts;
-(MSOContactFolderCollectionFetcher*) getChildFolders;
@end