/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOItemOperations.h"
#import "MSOItem.h"
#import "MSOFileFetcher.h"
#import "MSOFolderFetcher.h"

/**
* The header for type MSOItemFetcher.
*/


@protocol MSOItemFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOItem* item, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOItem*, NSError * error))callback;
@end

@interface MSOItemFetcher : MSOODataMediaEntityFetcher<MSOItemFetcher>

-(MSOItemOperations*) getOperations;

-(MSOFileFetcher*) asFile;
-(MSOFolderFetcher*) asFolder;

@end