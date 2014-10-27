/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryTenantDetailOperations.h"
#import "MSDirectoryTenantDetail.h"

/**
* The header for type MSDirectoryTenantDetailFetcher.
*/

@protocol MSDirectoryTenantDetailFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryTenantDetail* tenantDetail, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryTenantDetail*, NSError * error))callback;
@end

@interface MSDirectoryTenantDetailFetcher : MSDirectoryODataEntityFetcher<MSDirectoryTenantDetailFetcher>

-(MSDirectoryTenantDetailOperations*) getOperations;
	
@end