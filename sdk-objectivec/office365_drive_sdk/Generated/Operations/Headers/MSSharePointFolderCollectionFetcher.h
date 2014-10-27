/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointFolder.h"
#import "MSSharePointODataCollectionFetcher.h"
#import "MSSharePointFolderFetcher.h"

/**
* The header for type MSSharePointFolderCollectionFetcher.
*/

@protocol MSSharePointFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSSharePointFolder> *folders, NSError *error))callback;

@end

@interface MSSharePointFolderCollectionFetcher : MSSharePointODataCollectionFetcher<MSSharePointFolderCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSSharePointFolder* )entity :(void (^)(MSSharePointFolder *folder, NSError *e))callback;

-(MSSharePointFolderFetcher*)getById:(NSString *)Id;

@end
