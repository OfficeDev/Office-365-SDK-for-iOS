/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSubscribedSku.h"
#import "MSODataCollectionFetcher.h"
#import "MSSubscribedSkuFetcher.h"

/**
* The header for type MSSubscribedSkuCollectionFetcher.
*/

@protocol MSSubscribedSkuCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSSubscribedSku> *subscribedSkus, NSError *error))callback;

@end

@interface MSSubscribedSkuCollectionFetcher : MSODataCollectionFetcher<MSSubscribedSkuCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSSubscribedSku* )entity :(void (^)(MSSubscribedSku *subscribedSku, NSError *e))callback;

-(MSSubscribedSkuFetcher*)getById:(NSString *)Id;

@end
