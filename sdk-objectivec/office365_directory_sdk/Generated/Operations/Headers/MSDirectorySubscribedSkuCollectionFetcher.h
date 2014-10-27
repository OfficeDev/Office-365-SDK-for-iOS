/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectorySubscribedSku.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectorySubscribedSkuFetcher.h"

/**
* The header for type MSDirectorySubscribedSkuCollectionFetcher.
*/

@protocol MSDirectorySubscribedSkuCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectorySubscribedSku> *subscribedSkus, NSError *error))callback;

@end

@interface MSDirectorySubscribedSkuCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectorySubscribedSkuCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectorySubscribedSku* )entity :(void (^)(MSDirectorySubscribedSku *subscribedSku, NSError *e))callback;

-(MSDirectorySubscribedSkuFetcher*)getById:(NSString *)Id;

@end
