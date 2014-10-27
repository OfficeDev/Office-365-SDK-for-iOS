/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookUser.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookUserFetcher.h"

/**
* The header for type MSOutlookUserCollectionFetcher.
*/

@protocol MSOutlookUserCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookUser> *users, NSError *error))callback;

@end

@interface MSOutlookUserCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookUserCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookUser* )entity :(void (^)(MSOutlookUser *user, NSError *e))callback;

-(MSOutlookUserFetcher*)getById:(NSString *)Id;

@end
