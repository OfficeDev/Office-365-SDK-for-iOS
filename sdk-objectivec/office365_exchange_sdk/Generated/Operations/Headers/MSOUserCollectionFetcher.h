/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOUser.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOUserFetcher.h"

/**
* The header for type MSOUserCollectionFetcher.
*/

@interface MSOUserCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOUser* )entity :(void (^)(MSOUser *user, NSError *e))callback;

-(MSOUserFetcher*)getById:(NSString *)Id;
@end
