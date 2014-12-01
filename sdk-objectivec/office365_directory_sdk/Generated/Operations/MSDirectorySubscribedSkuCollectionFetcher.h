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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectorySubscribedSku> *subscribedSkus, MSODataException *error))callback;

-(id<MSDirectorySubscribedSkuCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectorySubscribedSkuCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectorySubscribedSkuCollectionFetcher>)top : (int) value;
-(id<MSDirectorySubscribedSkuCollectionFetcher>)skip : (int) value;
-(id<MSDirectorySubscribedSkuCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectorySubscribedSkuCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectorySubscribedSkuCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectorySubscribedSkuCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectorySubscribedSkuCollectionFetcher : MSODataCollectionFetcher<MSDirectorySubscribedSkuCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectorySubscribedSkuFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addSubscribedSku:(MSDirectorySubscribedSku* )entity withCallback:(void (^)(MSDirectorySubscribedSku *subscribedSku, MSODataException *e))callback;

@end