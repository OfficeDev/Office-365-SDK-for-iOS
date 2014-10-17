/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOCurrentUserRequestContext.h"
#import "MSOCurrentUserRequestContextFetcher.h"

/**
* The header for type MSOCurrentUserRequestContextCollectionFetcher.
*/

@interface MSOCurrentUserRequestContextCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOCurrentUserRequestContext> *CurrentUserRequestContext, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOCurrentUserRequestContext* )entity :(void (^)(MSOCurrentUserRequestContext *currentUserRequestContext, NSError *e))callback;

-(MSOCurrentUserRequestContextFetcher*)getById:(NSString *)Id;
@end
