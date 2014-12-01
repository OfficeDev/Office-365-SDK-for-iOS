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
#import "MSDirectoryOAuth2PermissionGrantOperations.h"
#import "MSDirectoryOAuth2PermissionGrant.h"


/**
* The header for type MSDirectoryOAuth2PermissionGrantFetcher.
*/

@protocol MSDirectoryOAuth2PermissionGrantFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryOAuth2PermissionGrant* oAuth2PermissionGrant, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateOAuth2PermissionGrant:(id)entity withCallback:(void (^)(MSDirectoryOAuth2PermissionGrant*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteOAuth2PermissionGrant:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryOAuth2PermissionGrantFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryOAuth2PermissionGrantFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryOAuth2PermissionGrantFetcher : MSODataEntityFetcher<MSDirectoryOAuth2PermissionGrantFetcher>

-(MSDirectoryOAuth2PermissionGrantOperations*) getOperations;

	
@end