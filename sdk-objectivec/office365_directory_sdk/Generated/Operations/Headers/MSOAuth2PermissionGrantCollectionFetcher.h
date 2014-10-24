/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAuth2PermissionGrant.h"
#import "MSODataCollectionFetcher.h"
#import "MSOAuth2PermissionGrantFetcher.h"

/**
* The header for type MSOAuth2PermissionGrantCollectionFetcher.
*/

@protocol MSOAuth2PermissionGrantCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOAuth2PermissionGrant> *oAuth2PermissionGrants, NSError *error))callback;

@end

@interface MSOAuth2PermissionGrantCollectionFetcher : MSODataCollectionFetcher<MSOAuth2PermissionGrantCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOAuth2PermissionGrant* )entity :(void (^)(MSOAuth2PermissionGrant *oAuth2PermissionGrant, NSError *e))callback;

-(MSOAuth2PermissionGrantFetcher*)getById:(NSString *)Id;

@end
