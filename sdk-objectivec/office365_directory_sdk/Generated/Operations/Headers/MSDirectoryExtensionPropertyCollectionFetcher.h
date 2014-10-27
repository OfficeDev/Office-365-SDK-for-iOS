/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryExtensionProperty.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryExtensionPropertyFetcher.h"

/**
* The header for type MSDirectoryExtensionPropertyCollectionFetcher.
*/

@protocol MSDirectoryExtensionPropertyCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryExtensionProperty> *extensionPropertys, NSError *error))callback;

@end

@interface MSDirectoryExtensionPropertyCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryExtensionPropertyCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryExtensionProperty* )entity :(void (^)(MSDirectoryExtensionProperty *extensionProperty, NSError *e))callback;

-(MSDirectoryExtensionPropertyFetcher*)getById:(NSString *)Id;

@end
