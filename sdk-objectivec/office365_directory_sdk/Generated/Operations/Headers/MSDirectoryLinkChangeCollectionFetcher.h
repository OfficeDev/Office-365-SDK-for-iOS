/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryLinkChange.h"
#import "MSODataCollectionFetcher.h"
#import "MSDirectoryLinkChangeFetcher.h"

/**
* The header for type MSDirectoryLinkChangeCollectionFetcher.
*/

@protocol MSDirectoryLinkChangeCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryLinkChange> *directoryLinkChanges, NSError *error))callback;

@end

@interface MSDirectoryLinkChangeCollectionFetcher : MSODataCollectionFetcher<MSDirectoryLinkChangeCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryLinkChange* )entity :(void (^)(MSDirectoryLinkChange *directoryLinkChange, NSError *e))callback;

-(MSDirectoryLinkChangeFetcher*)getById:(NSString *)Id;

@end
