/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSServicePrincipal.h"
#import "MSODataCollectionFetcher.h"
#import "MSServicePrincipalFetcher.h"

/**
* The header for type MSServicePrincipalCollectionFetcher.
*/

@protocol MSServicePrincipalCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSServicePrincipal> *servicePrincipals, NSError *error))callback;

@end

@interface MSServicePrincipalCollectionFetcher : MSODataCollectionFetcher<MSServicePrincipalCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSServicePrincipal* )entity :(void (^)(MSServicePrincipal *servicePrincipal, NSError *e))callback;

-(MSServicePrincipalFetcher*)getById:(NSString *)Id;

@end
