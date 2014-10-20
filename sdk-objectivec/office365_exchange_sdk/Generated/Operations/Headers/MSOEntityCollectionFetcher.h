/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEntity.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOEntityFetcher.h"

/**
* The header for type MSOEntityCollectionFetcher.
*/

@interface MSOEntityCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOEntity* )entity :(void (^)(MSOEntity *entity, NSError *e))callback;

-(MSOEntityFetcher*)getById:(NSString *)Id;
@end
