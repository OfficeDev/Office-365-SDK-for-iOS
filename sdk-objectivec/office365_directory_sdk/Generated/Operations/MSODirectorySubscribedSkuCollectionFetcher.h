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
#import "MSODirectorySubscribedSku.h"
#import "MSODirectorySubscribedSkuFetcher.h"

/**
* The header for type MSODirectorySubscribedSkuCollectionFetcher.
*/

@protocol MSODirectorySubscribedSkuCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectorySubscribedSku> *subscribedSkus, NSError *error))callback;

@end

@interface MSODirectorySubscribedSkuCollectionFetcher : MSODataCollectionFetcher<MSODirectorySubscribedSkuCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectorySubscribedSku* )entity withCallback:(void (^)(MSODirectorySubscribedSku *subscribedSku, NSError *e))callback;

-(MSODirectorySubscribedSkuFetcher*)getById:(NSString *)Id;

@end