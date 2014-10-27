/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryTenantDetail.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryTenantDetailFetcher.h"

/**
* The header for type MSDirectoryTenantDetailCollectionFetcher.
*/

@protocol MSDirectoryTenantDetailCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryTenantDetail> *tenantDetails, NSError *error))callback;

@end

@interface MSDirectoryTenantDetailCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryTenantDetailCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryTenantDetail* )entity :(void (^)(MSDirectoryTenantDetail *tenantDetail, NSError *e))callback;

-(MSDirectoryTenantDetailFetcher*)getById:(NSString *)Id;

@end
