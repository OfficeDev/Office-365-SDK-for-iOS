/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSSubscribedSkuOperations.h"
#import "MSSubscribedSku.h"

/**
* The header for type MSSubscribedSkuFetcher.
*/

@protocol MSSubscribedSkuFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSSubscribedSku* subscribedSku, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSSubscribedSku*, NSError * error))callback;
@end

@interface MSSubscribedSkuFetcher : MSODataEntityFetcher<MSSubscribedSkuFetcher>

-(MSSubscribedSkuOperations*) getOperations;
	
@end