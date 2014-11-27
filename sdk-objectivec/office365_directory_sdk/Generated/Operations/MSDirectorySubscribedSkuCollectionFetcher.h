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
#import "MSDirectorySubscribedSku.h"
#import "MSDirectorySubscribedSkuFetcher.h"

/**
* The header for type MSDirectorySubscribedSkuCollectionFetcher.
*/

@protocol MSDirectorySubscribedSkuCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectorySubscribedSku> *subscribedSkus, NSError *error))callback;
-(MSDirectorySubscribedSkuFetcher*)select : (NSString*) params;
-(MSDirectorySubscribedSkuFetcher*)filter : (NSString*) params;
-(MSDirectorySubscribedSkuFetcher*)top : (int) value;
-(MSDirectorySubscribedSkuFetcher*)skip : (int) value;
-(MSDirectorySubscribedSkuFetcher*)expand : (NSString*) value;
-(MSDirectorySubscribedSkuFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectorySubscribedSkuCollectionFetcher : MSODataCollectionFetcher<MSDirectorySubscribedSkuCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addSubscribedSku:(MSDirectorySubscribedSku* )entity withCallback:(void (^)(MSDirectorySubscribedSku *subscribedSku, NSError *e))callback;

-(MSDirectorySubscribedSkuFetcher*)getById:(NSString *)Id;

@end