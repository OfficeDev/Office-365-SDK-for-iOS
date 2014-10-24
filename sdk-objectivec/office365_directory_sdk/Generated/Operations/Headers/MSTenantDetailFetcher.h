/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSTenantDetailOperations.h"
#import "MSTenantDetail.h"

/**
* The header for type MSTenantDetailFetcher.
*/

@protocol MSTenantDetailFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSTenantDetail* tenantDetail, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSTenantDetail*, NSError * error))callback;
@end

@interface MSTenantDetailFetcher : MSODataEntityFetcher<MSTenantDetailFetcher>

-(MSTenantDetailOperations*) getOperations;
	
@end