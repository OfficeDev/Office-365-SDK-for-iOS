/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesFolder.h"
#import "MSFilesODataCollectionFetcher.h"
#import "MSFilesFolderFetcher.h"

/**
* The header for type MSFilesFolderCollectionFetcher.
*/

@protocol MSFilesFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSFilesFolder> *folders, NSError *error))callback;

@end

@interface MSFilesFolderCollectionFetcher : MSFilesODataCollectionFetcher<MSFilesFolderCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSFilesFolder* )entity :(void (^)(MSFilesFolder *folder, NSError *e))callback;

-(MSFilesFolderFetcher*)getById:(NSString *)Id;

@end
