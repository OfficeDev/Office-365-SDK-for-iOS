/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryApplicationOperations.h"
#import "MSDirectoryApplication.h"
@class MSDirectoryExtensionPropertyCollectionFetcher;

/**
* The header for type MSDirectoryApplicationFetcher.
*/

@protocol MSDirectoryApplicationFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryApplication* application, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryApplication*, NSError * error))callback;
@end

@interface MSDirectoryApplicationFetcher : MSDirectoryODataEntityFetcher<MSDirectoryApplicationFetcher>

-(MSDirectoryApplicationOperations*) getOperations;
-(MSDirectoryExtensionPropertyCollectionFetcher*) getextensionProperties;
	
@end