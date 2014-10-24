/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSOAuth2PermissionGrantOperations.h"
#import "MSOAuth2PermissionGrant.h"

/**
* The header for type MSOAuth2PermissionGrantFetcher.
*/

@protocol MSOAuth2PermissionGrantFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOAuth2PermissionGrant* oAuth2PermissionGrant, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOAuth2PermissionGrant*, NSError * error))callback;
@end

@interface MSOAuth2PermissionGrantFetcher : MSODataEntityFetcher<MSOAuth2PermissionGrantFetcher>

-(MSOAuth2PermissionGrantOperations*) getOperations;
	
@end