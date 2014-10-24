/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSExtensionProperty.h"
#import "MSODataCollectionFetcher.h"
#import "MSExtensionPropertyFetcher.h"

/**
* The header for type MSExtensionPropertyCollectionFetcher.
*/

@protocol MSExtensionPropertyCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSExtensionProperty> *extensionPropertys, NSError *error))callback;

@end

@interface MSExtensionPropertyCollectionFetcher : MSODataCollectionFetcher<MSExtensionPropertyCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSExtensionProperty* )entity :(void (^)(MSExtensionProperty *extensionProperty, NSError *e))callback;

-(MSExtensionPropertyFetcher*)getById:(NSString *)Id;

@end
