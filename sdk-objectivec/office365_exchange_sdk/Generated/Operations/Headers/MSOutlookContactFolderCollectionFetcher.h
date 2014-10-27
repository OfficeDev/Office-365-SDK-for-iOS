/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookContactFolder.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookContactFolderFetcher.h"

/**
* The header for type MSOutlookContactFolderCollectionFetcher.
*/

@protocol MSOutlookContactFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookContactFolder> *contactFolders, NSError *error))callback;

@end

@interface MSOutlookContactFolderCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookContactFolderCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookContactFolder* )entity :(void (^)(MSOutlookContactFolder *contactFolder, NSError *e))callback;

-(MSOutlookContactFolderFetcher*)getById:(NSString *)Id;

@end
