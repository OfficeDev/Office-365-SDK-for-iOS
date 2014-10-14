/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOUser.h"
#import "MSOUserFetcher.h"

@interface MSOUserCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOUser> *User, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOUser* )entity :(void (^)(MSOUser *user, NSError *e))callback;

-(MSOUserFetcher*)getById:(NSString *)Id;
@end
