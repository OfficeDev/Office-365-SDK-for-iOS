/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryApplication.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryApplicationFetcher.h"

/**
* The header for type MSDirectoryApplicationCollectionFetcher.
*/

@protocol MSDirectoryApplicationCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryApplication> *applications, NSError *error))callback;

@end

@interface MSDirectoryApplicationCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryApplicationCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryApplication* )entity :(void (^)(MSDirectoryApplication *application, NSError *e))callback;

-(MSDirectoryApplicationFetcher*)getById:(NSString *)Id;

@end
