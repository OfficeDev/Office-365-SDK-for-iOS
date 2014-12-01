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
#import "MSDiscoveryServiceInfo.h"
#import "MSDiscoveryServiceInfoFetcher.h"

/**
* The header for type MSDiscoveryServiceInfoCollectionFetcher.
*/

@protocol MSDiscoveryServiceInfoCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDiscoveryServiceInfo> *serviceInfos, MSODataException *error))callback;

-(id<MSDiscoveryServiceInfoCollectionFetcher>)select : (NSString*) params;
-(id<MSDiscoveryServiceInfoCollectionFetcher>)filter : (NSString*) params;
-(id<MSDiscoveryServiceInfoCollectionFetcher>)top : (int) value;
-(id<MSDiscoveryServiceInfoCollectionFetcher>)skip : (int) value;
-(id<MSDiscoveryServiceInfoCollectionFetcher>)expand : (NSString*) value;
-(id<MSDiscoveryServiceInfoCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDiscoveryServiceInfoCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDiscoveryServiceInfoCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDiscoveryServiceInfoCollectionFetcher : MSODataCollectionFetcher<MSDiscoveryServiceInfoCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDiscoveryServiceInfoFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addServiceInfo:(MSDiscoveryServiceInfo* )entity withCallback:(void (^)(MSDiscoveryServiceInfo *serviceInfo, MSODataException *e))callback;

@end