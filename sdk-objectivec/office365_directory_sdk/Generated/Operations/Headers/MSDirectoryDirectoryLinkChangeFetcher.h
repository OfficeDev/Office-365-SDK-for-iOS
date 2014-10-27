/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryDirectoryLinkChangeOperations.h"
#import "MSDirectoryDirectoryLinkChange.h"

/**
* The header for type MSDirectoryDirectoryLinkChangeFetcher.
*/

@protocol MSDirectoryDirectoryLinkChangeFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryDirectoryLinkChange* directoryLinkChange, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryDirectoryLinkChange*, NSError * error))callback;
@end

@interface MSDirectoryDirectoryLinkChangeFetcher : MSDirectoryODataEntityFetcher<MSDirectoryDirectoryLinkChangeFetcher>

-(MSDirectoryDirectoryLinkChangeOperations*) getOperations;
	
@end