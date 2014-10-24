/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSGroup.h"
#import "MSODataCollectionFetcher.h"
#import "MSGroupFetcher.h"

/**
* The header for type MSGroupCollectionFetcher.
*/

@protocol MSGroupCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSGroup> *groups, NSError *error))callback;

@end

@interface MSGroupCollectionFetcher : MSODataCollectionFetcher<MSGroupCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSGroup* )entity :(void (^)(MSGroup *group, NSError *e))callback;

-(MSGroupFetcher*)getById:(NSString *)Id;

@end
