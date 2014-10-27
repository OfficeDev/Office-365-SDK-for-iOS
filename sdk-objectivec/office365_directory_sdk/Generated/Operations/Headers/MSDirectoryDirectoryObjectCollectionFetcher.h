/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryObject.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryDirectoryObjectFetcher.h"

/**
* The header for type MSDirectoryDirectoryObjectCollectionFetcher.
*/

@protocol MSDirectoryDirectoryObjectCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryDirectoryObject> *directoryObjects, NSError *error))callback;

@end

@interface MSDirectoryDirectoryObjectCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryDirectoryObjectCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryDirectoryObject* )entity :(void (^)(MSDirectoryDirectoryObject *directoryObject, NSError *e))callback;

-(MSDirectoryDirectoryObjectFetcher*)getById:(NSString *)Id;

@end
