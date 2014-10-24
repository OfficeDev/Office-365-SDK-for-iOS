/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSContact.h"
#import "MSODataCollectionFetcher.h"
#import "MSContactFetcher.h"

/**
* The header for type MSContactCollectionFetcher.
*/

@protocol MSContactCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSContact> *contacts, NSError *error))callback;

@end

@interface MSContactCollectionFetcher : MSODataCollectionFetcher<MSContactCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSContact* )entity :(void (^)(MSContact *contact, NSError *e))callback;

-(MSContactFetcher*)getById:(NSString *)Id;

@end
