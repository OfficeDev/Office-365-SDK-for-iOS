/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryOAuth2PermissionGrantOperations.h"
#import "MSDirectoryOAuth2PermissionGrant.h"

/**
* The header for type MSDirectoryOAuth2PermissionGrantFetcher.
*/

@protocol MSDirectoryOAuth2PermissionGrantFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryOAuth2PermissionGrant* oAuth2PermissionGrant, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryOAuth2PermissionGrant*, NSError * error))callback;
@end

@interface MSDirectoryOAuth2PermissionGrantFetcher : MSDirectoryODataEntityFetcher<MSDirectoryOAuth2PermissionGrantFetcher>

-(MSDirectoryOAuth2PermissionGrantOperations*) getOperations;
	
@end