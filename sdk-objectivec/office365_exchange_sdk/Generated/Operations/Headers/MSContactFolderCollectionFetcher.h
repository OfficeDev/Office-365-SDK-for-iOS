/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSContactFolder.h"
#import "MSODataCollectionFetcher.h"
#import "MSContactFolderFetcher.h"

/**
* The header for type MSContactFolderCollectionFetcher.
*/

@protocol MSContactFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSContactFolder> *contactFolders, NSError *error))callback;

@end

@interface MSContactFolderCollectionFetcher : MSODataCollectionFetcher<MSContactFolderCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSContactFolder* )entity :(void (^)(MSContactFolder *contactFolder, NSError *e))callback;

-(MSContactFolderFetcher*)getById:(NSString *)Id;

@end
