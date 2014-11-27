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
#import "MSDirectoryTenantDetail.h"
#import "MSDirectoryTenantDetailFetcher.h"

/**
* The header for type MSDirectoryTenantDetailCollectionFetcher.
*/

@protocol MSDirectoryTenantDetailCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryTenantDetail> *tenantDetails, NSError *error))callback;

-(id<MSDirectoryTenantDetailCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryTenantDetailCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryTenantDetailCollectionFetcher>)top : (int) value;
-(id<MSDirectoryTenantDetailCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryTenantDetailCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryTenantDetailCollectionFetcher>)orderBy : (NSString*) params;

@end

@interface MSDirectoryTenantDetailCollectionFetcher : MSODataCollectionFetcher<MSDirectoryTenantDetailCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;
-(MSDirectoryTenantDetailFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addTenantDetail:(MSDirectoryTenantDetail* )entity withCallback:(void (^)(MSDirectoryTenantDetail *tenantDetail, NSError *e))callback;

@end