/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryLinkChange.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryDirectoryLinkChangeFetcher.h"

/**
* The header for type MSDirectoryDirectoryLinkChangeCollectionFetcher.
*/

@protocol MSDirectoryDirectoryLinkChangeCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryDirectoryLinkChange> *directoryLinkChanges, NSError *error))callback;

@end

@interface MSDirectoryDirectoryLinkChangeCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryDirectoryLinkChangeCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryDirectoryLinkChange* )entity :(void (^)(MSDirectoryDirectoryLinkChange *directoryLinkChange, NSError *e))callback;

-(MSDirectoryDirectoryLinkChangeFetcher*)getById:(NSString *)Id;

@end
