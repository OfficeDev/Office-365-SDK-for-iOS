/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSApplication.h"
#import "MSODataCollectionFetcher.h"
#import "MSApplicationFetcher.h"

/**
* The header for type MSApplicationCollectionFetcher.
*/

@protocol MSApplicationCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSApplication> *applications, NSError *error))callback;

@end

@interface MSApplicationCollectionFetcher : MSODataCollectionFetcher<MSApplicationCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSApplication* )entity :(void (^)(MSApplication *application, NSError *e))callback;

-(MSApplicationFetcher*)getById:(NSString *)Id;

@end
