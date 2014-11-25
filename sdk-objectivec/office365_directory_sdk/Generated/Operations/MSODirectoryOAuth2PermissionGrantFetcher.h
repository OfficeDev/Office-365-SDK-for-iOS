/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import <office365_odata_base/office365_odata_base.h>
#import "MSODirectoryOAuth2PermissionGrantOperations.h"
#import "MSODirectoryOAuth2PermissionGrant.h"


/**
* The header for type MSODirectoryOAuth2PermissionGrantFetcher.
*/

@protocol MSODirectoryOAuth2PermissionGrantFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSODirectoryOAuth2PermissionGrant* oAuth2PermissionGrant, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSODirectoryOAuth2PermissionGrant*, NSError * error))callback;
@end

@interface MSODirectoryOAuth2PermissionGrantFetcher : MSODataEntityFetcher<MSODirectoryOAuth2PermissionGrantFetcher>

-(MSODirectoryOAuth2PermissionGrantOperations*) getOperations;

	
@end