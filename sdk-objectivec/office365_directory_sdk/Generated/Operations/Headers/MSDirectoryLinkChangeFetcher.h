/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSDirectoryLinkChangeOperations.h"
#import "MSDirectoryLinkChange.h"

/**
* The header for type MSDirectoryLinkChangeFetcher.
*/

@protocol MSDirectoryLinkChangeFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryLinkChange* directoryLinkChange, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryLinkChange*, NSError * error))callback;
@end

@interface MSDirectoryLinkChangeFetcher : MSODataEntityFetcher<MSDirectoryLinkChangeFetcher>

-(MSDirectoryLinkChangeOperations*) getOperations;
	
@end