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

@class MSGraphServiceOAuth2PermissionGrantOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceOAuth2PermissionGrantFetcher.
*/


@protocol MSGraphServiceOAuth2PermissionGrantFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceOAuth2PermissionGrant* oAuth2PermissionGrant, MSODataException *error))callback;
-(NSURLSessionTask*) updateOAuth2PermissionGrant:(id)entity withCallback:(void (^)(MSGraphServiceOAuth2PermissionGrant*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteOAuth2PermissionGrant:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceOAuth2PermissionGrantFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceOAuth2PermissionGrantFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceOAuth2PermissionGrantFetcher>)select : (NSString*) params;
-(id<MSGraphServiceOAuth2PermissionGrantFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceOAuth2PermissionGrantOperations*) getOperations;
@end

@interface MSGraphServiceOAuth2PermissionGrantFetcher : MSODataEntityFetcher<MSGraphServiceOAuth2PermissionGrantFetcher>

@end