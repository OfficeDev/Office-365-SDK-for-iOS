/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOFolderOperations.h"
#import "MSOFolder.h"

@class MSOItemCollectionFetcher;


/**
* The header for type MSOFolderFetcher.
*/

@interface MSOFolderFetcher : MSOODataEntityFetcher

-(MSOFolderOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOFolder* folder, NSError *error))callback;

-(MSOItemCollectionFetcher*) getchildren;
@end