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
#import "MSDirectoryTenantDetailOperations.h"
#import "MSDirectoryTenantDetail.h"


/**
* The header for type MSDirectoryTenantDetailFetcher.
*/

@protocol MSDirectoryTenantDetailFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryTenantDetail* tenantDetail, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateTenantDetail:(id)entity withCallback:(void (^)(MSDirectoryTenantDetail*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteTenantDetail:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryTenantDetailFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryTenantDetailFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryTenantDetailFetcher : MSODataEntityFetcher<MSDirectoryTenantDetailFetcher>

-(MSDirectoryTenantDetailOperations*) getOperations;

	
@end