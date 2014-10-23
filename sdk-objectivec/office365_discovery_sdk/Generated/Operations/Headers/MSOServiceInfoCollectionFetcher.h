/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOServiceInfo.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOServiceInfoFetcher.h"

/**
* The header for type MSOServiceInfoCollectionFetcher.
*/

@protocol MSOServiceInfoCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOServiceInfo> *serviceInfos, NSError *error))callback;

@end

@interface MSOServiceInfoCollectionFetcher : MSOODataCollectionFetcher<MSOServiceInfoCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOServiceInfo* )entity :(void (^)(MSOServiceInfo *serviceInfo, NSError *e))callback;

-(MSOServiceInfoFetcher*)getById:(NSString *)Id;

@end
