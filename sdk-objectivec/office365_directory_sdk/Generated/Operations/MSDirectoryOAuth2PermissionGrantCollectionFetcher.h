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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryOAuth2PermissionGrant> *oAuth2PermissionGrants, MSODataException *error))callback;

-(id<MSDirectoryOAuth2PermissionGrantCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryOAuth2PermissionGrantCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryOAuth2PermissionGrantCollectionFetcher>)top : (int) value;
-(id<MSDirectoryOAuth2PermissionGrantCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryOAuth2PermissionGrantCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryOAuth2PermissionGrantCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryOAuth2PermissionGrantCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryOAuth2PermissionGrantCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryOAuth2PermissionGrantCollectionFetcher : MSODataCollectionFetcher<MSDirectoryOAuth2PermissionGrantCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryOAuth2PermissionGrantFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addOAuth2PermissionGrant:(MSDirectoryOAuth2PermissionGrant* )entity withCallback:(void (^)(MSDirectoryOAuth2PermissionGrant *oAuth2PermissionGrant, MSODataException *e))callback;

@end