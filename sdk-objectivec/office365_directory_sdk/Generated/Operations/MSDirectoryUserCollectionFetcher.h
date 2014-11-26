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
#import "MSDirectoryUser.h"
#import "MSDirectoryUserFetcher.h"

/**
* The header for type MSDirectoryUserCollectionFetcher.
*/

@protocol MSDirectoryUserCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryUser> *users, NSError *error))callback;

@end

@interface MSDirectoryUserCollectionFetcher : MSODataCollectionFetcher<MSDirectoryUserCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSDirectoryUser* )entity withCallback:(void (^)(MSDirectoryUser *user, NSError *e))callback;

-(MSDirectoryUserFetcher*)getById:(NSString *)Id;

@end