/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryObject.h"
#import "MSODataCollectionFetcher.h"
#import "MSDirectoryObjectFetcher.h"

/**
* The header for type MSDirectoryObjectCollectionFetcher.
*/

@protocol MSDirectoryObjectCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryObject> *directoryObjects, NSError *error))callback;

@end

@interface MSDirectoryObjectCollectionFetcher : MSODataCollectionFetcher<MSDirectoryObjectCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryObject* )entity :(void (^)(MSDirectoryObject *directoryObject, NSError *e))callback;

-(MSDirectoryObjectFetcher*)getById:(NSString *)Id;

@end
