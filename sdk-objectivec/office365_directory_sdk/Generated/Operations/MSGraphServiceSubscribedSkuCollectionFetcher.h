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

@class MSGraphServiceSubscribedSkuFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceSubscribedSkuCollectionFetcher.
*/

@protocol MSGraphServiceSubscribedSkuCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceSubscribedSku> *subscribedSkus, MSODataException *error))callback;

-(id<MSGraphServiceSubscribedSkuCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceSubscribedSkuCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceSubscribedSkuCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceSubscribedSkuCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceSubscribedSkuCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceSubscribedSkuCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceSubscribedSkuCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceSubscribedSkuCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceSubscribedSkuFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addSubscribedSku:(MSGraphServiceSubscribedSku* )entity withCallback:(void (^)(MSGraphServiceSubscribedSku *subscribedSku, MSODataException *e))callback;

@end

@interface MSGraphServiceSubscribedSkuCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceSubscribedSkuCollectionFetcher>

@end