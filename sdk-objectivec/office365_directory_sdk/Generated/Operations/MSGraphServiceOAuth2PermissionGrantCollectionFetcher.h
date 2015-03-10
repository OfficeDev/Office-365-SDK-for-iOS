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

@class MSGraphServiceOAuth2PermissionGrantFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceOAuth2PermissionGrantCollectionFetcher.
*/

@protocol MSGraphServiceOAuth2PermissionGrantCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceOAuth2PermissionGrant> *oAuth2PermissionGrants, MSODataException *error))callback;

-(id<MSGraphServiceOAuth2PermissionGrantCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceOAuth2PermissionGrantCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceOAuth2PermissionGrantCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceOAuth2PermissionGrantCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceOAuth2PermissionGrantCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceOAuth2PermissionGrantCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceOAuth2PermissionGrantCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceOAuth2PermissionGrantCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceOAuth2PermissionGrantFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addOAuth2PermissionGrant:(MSGraphServiceOAuth2PermissionGrant* )entity withCallback:(void (^)(MSGraphServiceOAuth2PermissionGrant *oAuth2PermissionGrant, MSODataException *e))callback;

@end

@interface MSGraphServiceOAuth2PermissionGrantCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceOAuth2PermissionGrantCollectionFetcher>

@end