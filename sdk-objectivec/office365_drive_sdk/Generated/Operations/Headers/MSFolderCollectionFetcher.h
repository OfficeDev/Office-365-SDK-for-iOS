/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFolder.h"
#import "MSODataCollectionFetcher.h"
#import "MSFolderFetcher.h"

/**
* The header for type MSFolderCollectionFetcher.
*/

@protocol MSFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSFolder> *folders, NSError *error))callback;

@end

@interface MSFolderCollectionFetcher : MSODataCollectionFetcher<MSFolderCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSFolder* )entity :(void (^)(MSFolder *folder, NSError *e))callback;

-(MSFolderFetcher*)getById:(NSString *)Id;

@end
