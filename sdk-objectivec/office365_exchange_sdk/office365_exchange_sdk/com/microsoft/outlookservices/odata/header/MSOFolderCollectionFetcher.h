/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOFolder.h"
#import "MSOFolderFetcher.h"

/**
* The header for type MSOFolderCollectionFetcher.
*/

@interface MSOFolderCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOFolder> *Folder, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOFolder* )entity :(void (^)(MSOFolder *folder, NSError *e))callback;

-(MSOFolderFetcher*)getById:(NSString *)Id;
@end
