/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryServiceInfo.h"
#import "MSDiscoveryODataCollectionFetcher.h"
#import "MSDiscoveryServiceInfoFetcher.h"

/**
* The header for type MSDiscoveryServiceInfoCollectionFetcher.
*/

@protocol MSDiscoveryServiceInfoCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDiscoveryServiceInfo> *serviceInfos, NSError *error))callback;

@end

@interface MSDiscoveryServiceInfoCollectionFetcher : MSDiscoveryODataCollectionFetcher<MSDiscoveryServiceInfoCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDiscoveryServiceInfo* )entity :(void (^)(MSDiscoveryServiceInfo *serviceInfo, NSError *e))callback;

-(MSDiscoveryServiceInfoFetcher*)getById:(NSString *)Id;

@end
