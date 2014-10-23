/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOServiceInfoOperations.h"
#import "MSOServiceInfo.h"

/**
* The header for type MSOServiceInfoFetcher.
*/

@protocol MSOServiceInfoFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOServiceInfo* serviceInfo, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOServiceInfo*, NSError * error))callback;
@end

@interface MSOServiceInfoFetcher : MSOODataEntityFetcher<MSOServiceInfoFetcher>

-(MSOServiceInfoOperations*) getOperations;
	
@end