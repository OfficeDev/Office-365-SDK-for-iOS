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


/**
* The header for type MSOFolderFetcher.
*/

@interface MSOFolderFetcher : MSOODataEntityFetcher

-(MSOFolderOperations*) getOperations;

-(MSOFolderCollectionFetcher*) getChildFolders;
-(MSOMessageCollectionFetcher*) getMessages;
@end