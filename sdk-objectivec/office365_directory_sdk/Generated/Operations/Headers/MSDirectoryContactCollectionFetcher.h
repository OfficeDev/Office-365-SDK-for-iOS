/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryContact.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryContactFetcher.h"

/**
* The header for type MSDirectoryContactCollectionFetcher.
*/

@protocol MSDirectoryContactCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryContact> *contacts, NSError *error))callback;

@end

@interface MSDirectoryContactCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryContactCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryContact* )entity :(void (^)(MSDirectoryContact *contact, NSError *e))callback;

-(MSDirectoryContactFetcher*)getById:(NSString *)Id;

@end
