/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFile.h"
#import "MSODataCollectionFetcher.h"
#import "MSFileFetcher.h"

/**
* The header for type MSFileCollectionFetcher.
*/

@protocol MSFileCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSFile> *files, NSError *error))callback;

@end

@interface MSFileCollectionFetcher : MSODataCollectionFetcher<MSFileCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSFile* )entity :(void (^)(MSFile *file, NSError *e))callback;

-(MSFileFetcher*)getById:(NSString *)Id;

@end
