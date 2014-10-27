/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFolder.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookFolderFetcher.h"

/**
* The header for type MSOutlookFolderCollectionFetcher.
*/

@protocol MSOutlookFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookFolder> *folders, NSError *error))callback;

@end

@interface MSOutlookFolderCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookFolderCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookFolder* )entity :(void (^)(MSOutlookFolder *folder, NSError *e))callback;

-(MSOutlookFolderFetcher*)getById:(NSString *)Id;

@end
