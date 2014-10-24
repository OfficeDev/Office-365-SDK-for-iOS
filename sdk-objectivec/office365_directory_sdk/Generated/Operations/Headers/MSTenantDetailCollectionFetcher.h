/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSTenantDetail.h"
#import "MSODataCollectionFetcher.h"
#import "MSTenantDetailFetcher.h"

/**
* The header for type MSTenantDetailCollectionFetcher.
*/

@protocol MSTenantDetailCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSTenantDetail> *tenantDetails, NSError *error))callback;

@end

@interface MSTenantDetailCollectionFetcher : MSODataCollectionFetcher<MSTenantDetailCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSTenantDetail* )entity :(void (^)(MSTenantDetail *tenantDetail, NSError *e))callback;

-(MSTenantDetailFetcher*)getById:(NSString *)Id;

@end
