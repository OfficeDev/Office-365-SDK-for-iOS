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

@class MSGraphServiceTenantDetailOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceTenantDetailFetcher.
*/


@protocol MSGraphServiceTenantDetailFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceTenantDetail* tenantDetail, MSODataException *error))callback;
-(NSURLSessionTask*) updateTenantDetail:(id)entity withCallback:(void (^)(MSGraphServiceTenantDetail*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteTenantDetail:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceTenantDetailFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceTenantDetailFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceTenantDetailFetcher>)select : (NSString*) params;
-(id<MSGraphServiceTenantDetailFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceTenantDetailOperations*) getOperations;
@end

@interface MSGraphServiceTenantDetailFetcher : MSODataEntityFetcher<MSGraphServiceTenantDetailFetcher>

@end