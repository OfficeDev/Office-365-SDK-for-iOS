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

@class MSGraphServiceTenantDetailFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceTenantDetailCollectionFetcher.
*/

@protocol MSGraphServiceTenantDetailCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceTenantDetail> *tenantDetails, MSODataException *error))callback;

-(id<MSGraphServiceTenantDetailCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceTenantDetailCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceTenantDetailCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceTenantDetailCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceTenantDetailCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceTenantDetailCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceTenantDetailCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceTenantDetailCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceTenantDetailFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addTenantDetail:(MSGraphServiceTenantDetail* )entity withCallback:(void (^)(MSGraphServiceTenantDetail *tenantDetail, MSODataException *e))callback;

@end

@interface MSGraphServiceTenantDetailCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceTenantDetailCollectionFetcher>

@end