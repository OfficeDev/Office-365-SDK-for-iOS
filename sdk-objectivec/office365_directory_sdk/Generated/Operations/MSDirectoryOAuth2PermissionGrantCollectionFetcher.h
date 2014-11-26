/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import <office365_odata_base/office365_odata_base.h>
#import "MSDirectoryOAuth2PermissionGrant.h"
#import "MSDirectoryOAuth2PermissionGrantFetcher.h"

/**
* The header for type MSDirectoryOAuth2PermissionGrantCollectionFetcher.
*/

@protocol MSDirectoryOAuth2PermissionGrantCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryOAuth2PermissionGrant> *oAuth2PermissionGrants, NSError *error))callback;

@end

@interface MSDirectoryOAuth2PermissionGrantCollectionFetcher : MSODataCollectionFetcher<MSDirectoryOAuth2PermissionGrantCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSDirectoryOAuth2PermissionGrant* )entity withCallback:(void (^)(MSDirectoryOAuth2PermissionGrant *oAuth2PermissionGrant, NSError *e))callback;

-(MSDirectoryOAuth2PermissionGrantFetcher*)getById:(NSString *)Id;

@end