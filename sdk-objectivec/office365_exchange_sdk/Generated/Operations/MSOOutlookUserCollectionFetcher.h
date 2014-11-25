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
#import "MSOOutlookUser.h"
#import "MSOOutlookUserFetcher.h"

/**
* The header for type MSOOutlookUserCollectionFetcher.
*/

@protocol MSOOutlookUserCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookUser> *users, NSError *error))callback;

@end

@interface MSOOutlookUserCollectionFetcher : MSODataCollectionFetcher<MSOOutlookUserCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookUser* )entity withCallback:(void (^)(MSOOutlookUser *user, NSError *e))callback;

-(MSOOutlookUserFetcher*)getById:(NSString *)Id;

@end