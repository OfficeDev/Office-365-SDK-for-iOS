/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryServicePrincipal.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryServicePrincipalFetcher.h"

/**
* The header for type MSDirectoryServicePrincipalCollectionFetcher.
*/

@protocol MSDirectoryServicePrincipalCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryServicePrincipal> *servicePrincipals, NSError *error))callback;

@end

@interface MSDirectoryServicePrincipalCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryServicePrincipalCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryServicePrincipal* )entity :(void (^)(MSDirectoryServicePrincipal *servicePrincipal, NSError *e))callback;

-(MSDirectoryServicePrincipalFetcher*)getById:(NSString *)Id;

@end
