/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOEntity.h"
#import "MSOEntityFetcher.h"

@interface MSOEntityCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOEntity> *Entity, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOEntity* )entity :(void (^)(MSOEntity *entity, NSError *e))callback;

-(MSOEntityFetcher*)getById:(NSString *)Id;
@end
