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

#import "MSDiscoveryServiceInfo.h"
#import "MSDiscoveryODataCollectionFetcher.h"
#import "MSDiscoveryServiceInfoFetcher.h"

/**
* The header for type MSDiscoveryServiceInfoCollectionFetcher.
*/

@protocol MSDiscoveryServiceInfoCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDiscoveryServiceInfo> *serviceInfos, NSError *error))callback;

@end

@interface MSDiscoveryServiceInfoCollectionFetcher : MSDiscoveryODataCollectionFetcher<MSDiscoveryServiceInfoCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSDiscoveryServiceInfo* )entity :(void (^)(MSDiscoveryServiceInfo *serviceInfo, NSError *e))callback;

-(MSDiscoveryServiceInfoFetcher*)getById:(NSString *)Id;

@end
