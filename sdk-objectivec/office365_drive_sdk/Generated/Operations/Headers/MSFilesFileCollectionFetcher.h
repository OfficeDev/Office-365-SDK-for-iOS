/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesFile.h"
#import "MSFilesODataCollectionFetcher.h"
#import "MSFilesFileFetcher.h"

/**
* The header for type MSFilesFileCollectionFetcher.
*/

@protocol MSFilesFileCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSFilesFile> *files, NSError *error))callback;

@end

@interface MSFilesFileCollectionFetcher : MSFilesODataCollectionFetcher<MSFilesFileCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSFilesFile* )entity :(void (^)(MSFilesFile *file, NSError *e))callback;

-(MSFilesFileFetcher*)getById:(NSString *)Id;

@end
