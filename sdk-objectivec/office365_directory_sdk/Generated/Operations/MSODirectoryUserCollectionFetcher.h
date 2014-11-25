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
#import "MSODirectoryUser.h"
#import "MSODirectoryUserFetcher.h"

/**
* The header for type MSODirectoryUserCollectionFetcher.
*/

@protocol MSODirectoryUserCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryUser> *users, NSError *error))callback;

@end

@interface MSODirectoryUserCollectionFetcher : MSODataCollectionFetcher<MSODirectoryUserCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryUser* )entity withCallback:(void (^)(MSODirectoryUser *user, NSError *e))callback;

-(MSODirectoryUserFetcher*)getById:(NSString *)Id;

@end