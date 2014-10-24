/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSApplicationOperations.h"
#import "MSApplication.h"
@class MSExtensionPropertyCollectionFetcher;

/**
* The header for type MSApplicationFetcher.
*/

@protocol MSApplicationFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSApplication* application, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSApplication*, NSError * error))callback;
@end

@interface MSApplicationFetcher : MSODataEntityFetcher<MSApplicationFetcher>

-(MSApplicationOperations*) getOperations;
-(MSExtensionPropertyCollectionFetcher*) getextensionProperties;
	
@end