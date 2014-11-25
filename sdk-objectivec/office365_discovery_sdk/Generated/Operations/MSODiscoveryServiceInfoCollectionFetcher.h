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
#import "MSODiscoveryServiceInfo.h"
#import "MSODiscoveryServiceInfoFetcher.h"

/**
* The header for type MSODiscoveryServiceInfoCollectionFetcher.
*/

@protocol MSODiscoveryServiceInfoCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODiscoveryServiceInfo> *serviceInfos, NSError *error))callback;

@end

@interface MSODiscoveryServiceInfoCollectionFetcher : MSODataCollectionFetcher<MSODiscoveryServiceInfoCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODiscoveryServiceInfo* )entity withCallback:(void (^)(MSODiscoveryServiceInfo *serviceInfo, NSError *e))callback;

-(MSODiscoveryServiceInfoFetcher*)getById:(NSString *)Id;

@end