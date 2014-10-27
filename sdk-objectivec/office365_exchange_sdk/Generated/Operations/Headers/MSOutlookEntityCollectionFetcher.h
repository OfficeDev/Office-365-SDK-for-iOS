/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookEntity.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookEntityFetcher.h"

/**
* The header for type MSOutlookEntityCollectionFetcher.
*/

@protocol MSOutlookEntityCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookEntity> *entitys, NSError *error))callback;

@end

@interface MSOutlookEntityCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookEntityCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookEntity* )entity :(void (^)(MSOutlookEntity *entity, NSError *e))callback;

-(MSOutlookEntityFetcher*)getById:(NSString *)Id;

@end
