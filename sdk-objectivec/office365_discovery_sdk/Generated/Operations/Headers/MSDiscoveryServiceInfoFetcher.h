/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryODataEntityFetcher.h"
#import "MSDiscoveryServiceInfoOperations.h"
#import "MSDiscoveryServiceInfo.h"

/**
* The header for type MSDiscoveryServiceInfoFetcher.
*/

@protocol MSDiscoveryServiceInfoFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDiscoveryServiceInfo* serviceInfo, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDiscoveryServiceInfo*, NSError * error))callback;
@end

@interface MSDiscoveryServiceInfoFetcher : MSDiscoveryODataEntityFetcher<MSDiscoveryServiceInfoFetcher>

-(MSDiscoveryServiceInfoOperations*) getOperations;
	
@end