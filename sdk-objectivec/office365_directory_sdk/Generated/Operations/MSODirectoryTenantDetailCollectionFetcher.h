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
#import "MSODirectoryTenantDetail.h"
#import "MSODirectoryTenantDetailFetcher.h"

/**
* The header for type MSODirectoryTenantDetailCollectionFetcher.
*/

@protocol MSODirectoryTenantDetailCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryTenantDetail> *tenantDetails, NSError *error))callback;

@end

@interface MSODirectoryTenantDetailCollectionFetcher : MSODataCollectionFetcher<MSODirectoryTenantDetailCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryTenantDetail* )entity withCallback:(void (^)(MSODirectoryTenantDetail *tenantDetail, NSError *e))callback;

-(MSODirectoryTenantDetailFetcher*)getById:(NSString *)Id;

@end