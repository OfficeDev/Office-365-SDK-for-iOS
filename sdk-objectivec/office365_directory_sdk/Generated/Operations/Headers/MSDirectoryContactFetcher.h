/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryContactOperations.h"
#import "MSDirectoryContact.h"

/**
* The header for type MSDirectoryContactFetcher.
*/

@protocol MSDirectoryContactFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryContact* contact, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryContact*, NSError * error))callback;
@end

@interface MSDirectoryContactFetcher : MSDirectoryODataEntityFetcher<MSDirectoryContactFetcher>

-(MSDirectoryContactOperations*) getOperations;
	
@end