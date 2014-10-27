/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryOAuth2PermissionGrant.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryOAuth2PermissionGrantFetcher.h"

/**
* The header for type MSDirectoryOAuth2PermissionGrantCollectionFetcher.
*/

@protocol MSDirectoryOAuth2PermissionGrantCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryOAuth2PermissionGrant> *oAuth2PermissionGrants, NSError *error))callback;

@end

@interface MSDirectoryOAuth2PermissionGrantCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryOAuth2PermissionGrantCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryOAuth2PermissionGrant* )entity :(void (^)(MSDirectoryOAuth2PermissionGrant *oAuth2PermissionGrant, NSError *e))callback;

-(MSDirectoryOAuth2PermissionGrantFetcher*)getById:(NSString *)Id;

@end
