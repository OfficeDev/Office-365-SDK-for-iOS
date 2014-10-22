/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCurrentUserRequestContext.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOCurrentUserRequestContextFetcher.h"

/**
* The header for type MSOCurrentUserRequestContextCollectionFetcher.
*/

@protocol MSOCurrentUserRequestContextCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOCurrentUserRequestContext> *currentUserRequestContexts, NSError *error))callback;

@end

@interface MSOCurrentUserRequestContextCollectionFetcher : MSOODataCollectionFetcher<MSOCurrentUserRequestContextCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOCurrentUserRequestContext* )entity :(void (^)(MSOCurrentUserRequestContext *currentUserRequestContext, NSError *e))callback;

-(MSOCurrentUserRequestContextFetcher*)getById:(NSString *)Id;

@end
