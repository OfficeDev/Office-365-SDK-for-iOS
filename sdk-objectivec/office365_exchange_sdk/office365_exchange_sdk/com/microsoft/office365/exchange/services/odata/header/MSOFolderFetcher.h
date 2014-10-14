/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOFolderOperations.h"
#import "MSOFolder.h"

@class MSOFolderCollectionFetcher;
@class MSOMessageCollectionFetcher;

@interface MSOFolderFetcher : MSOODataEntityFetcher

-(MSOFolderOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOFolder* folder, NSError *error))callback;

-(MSOFolderCollectionFetcher*) getChildFolders;
-(MSOMessageCollectionFetcher*) getMessages;
@end