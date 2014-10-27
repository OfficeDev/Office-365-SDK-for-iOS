/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryGroup.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryGroupFetcher.h"

/**
* The header for type MSDirectoryGroupCollectionFetcher.
*/

@protocol MSDirectoryGroupCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryGroup> *groups, NSError *error))callback;

@end

@interface MSDirectoryGroupCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryGroupCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryGroup* )entity :(void (^)(MSDirectoryGroup *group, NSError *e))callback;

-(MSDirectoryGroupFetcher*)getById:(NSString *)Id;

@end
