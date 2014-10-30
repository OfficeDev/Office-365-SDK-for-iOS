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

#import "MSOutlookUser.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookUserFetcher.h"

/**
* The header for type MSOutlookUserCollectionFetcher.
*/

@protocol MSOutlookUserCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookUser> *users, NSError *error))callback;

@end

@interface MSOutlookUserCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookUserCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookUser* )entity :(void (^)(MSOutlookUser *user, NSError *e))callback;

-(MSOutlookUserFetcher*)getById:(NSString *)Id;

@end
