/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectorySubscribedSkuOperations.h"
#import "MSDirectorySubscribedSku.h"

/**
* The header for type MSDirectorySubscribedSkuFetcher.
*/

@protocol MSDirectorySubscribedSkuFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectorySubscribedSku* subscribedSku, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectorySubscribedSku*, NSError * error))callback;
@end

@interface MSDirectorySubscribedSkuFetcher : MSDirectoryODataEntityFetcher<MSDirectorySubscribedSkuFetcher>

-(MSDirectorySubscribedSkuOperations*) getOperations;
	
@end