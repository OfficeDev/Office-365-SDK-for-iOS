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
#import "MSODirectoryOAuth2PermissionGrant.h"
#import "MSODirectoryOAuth2PermissionGrantFetcher.h"

/**
* The header for type MSODirectoryOAuth2PermissionGrantCollectionFetcher.
*/

@protocol MSODirectoryOAuth2PermissionGrantCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryOAuth2PermissionGrant> *oAuth2PermissionGrants, NSError *error))callback;

@end

@interface MSODirectoryOAuth2PermissionGrantCollectionFetcher : MSODataCollectionFetcher<MSODirectoryOAuth2PermissionGrantCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryOAuth2PermissionGrant* )entity withCallback:(void (^)(MSODirectoryOAuth2PermissionGrant *oAuth2PermissionGrant, NSError *e))callback;

-(MSODirectoryOAuth2PermissionGrantFetcher*)getById:(NSString *)Id;

@end