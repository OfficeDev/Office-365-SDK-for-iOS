/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSEntity.h"
#import "MSODataCollectionFetcher.h"
#import "MSEntityFetcher.h"

/**
* The header for type MSEntityCollectionFetcher.
*/

@protocol MSEntityCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSEntity> *entitys, NSError *error))callback;

@end

@interface MSEntityCollectionFetcher : MSODataCollectionFetcher<MSEntityCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSEntity* )entity :(void (^)(MSEntity *entity, NSError *e))callback;

-(MSEntityFetcher*)getById:(NSString *)Id;

@end
