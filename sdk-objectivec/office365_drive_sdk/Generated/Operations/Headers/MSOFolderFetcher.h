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


@protocol MSOFolderFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOFolder* folder, NSError *error))callback;

@end

@interface MSOFolderFetcher : MSOODataEntityFetcher<MSOFolderFetcher>

-(MSOFolderOperations*) getOperations;

-(MSOItemCollectionFetcher*) getchildren;
@end