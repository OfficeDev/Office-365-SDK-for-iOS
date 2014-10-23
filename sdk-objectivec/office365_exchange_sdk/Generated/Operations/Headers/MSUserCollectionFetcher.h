/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSUser.h"
#import "MSODataCollectionFetcher.h"
#import "MSUserFetcher.h"

/**
* The header for type MSUserCollectionFetcher.
*/

@protocol MSUserCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSUser> *users, NSError *error))callback;

@end

@interface MSUserCollectionFetcher : MSODataCollectionFetcher<MSUserCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSUser* )entity :(void (^)(MSUser *user, NSError *e))callback;

-(MSUserFetcher*)getById:(NSString *)Id;

@end
