/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSServiceInfo.h"
#import "MSODataCollectionFetcher.h"
#import "MSServiceInfoFetcher.h"

/**
* The header for type MSServiceInfoCollectionFetcher.
*/

@protocol MSServiceInfoCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSServiceInfo> *serviceInfos, NSError *error))callback;

@end

@interface MSServiceInfoCollectionFetcher : MSODataCollectionFetcher<MSServiceInfoCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSServiceInfo* )entity :(void (^)(MSServiceInfo *serviceInfo, NSError *e))callback;

-(MSServiceInfoFetcher*)getById:(NSString *)Id;

@end
