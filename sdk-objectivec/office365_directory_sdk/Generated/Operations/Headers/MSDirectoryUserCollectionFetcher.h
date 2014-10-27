/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryUser.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryUserFetcher.h"

/**
* The header for type MSDirectoryUserCollectionFetcher.
*/

@protocol MSDirectoryUserCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryUser> *users, NSError *error))callback;

@end

@interface MSDirectoryUserCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryUserCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryUser* )entity :(void (^)(MSDirectoryUser *user, NSError *e))callback;

-(MSDirectoryUserFetcher*)getById:(NSString *)Id;

@end
