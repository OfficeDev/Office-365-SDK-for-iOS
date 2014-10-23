/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSServiceInfoOperations.h"
#import "MSServiceInfo.h"

/**
* The header for type MSServiceInfoFetcher.
*/

@protocol MSServiceInfoFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSServiceInfo* serviceInfo, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSServiceInfo*, NSError * error))callback;
@end

@interface MSServiceInfoFetcher : MSODataEntityFetcher<MSServiceInfoFetcher>

-(MSServiceInfoOperations*) getOperations;
	
@end