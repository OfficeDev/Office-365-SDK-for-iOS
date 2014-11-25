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
#import "MSODirectoryContact.h"
#import "MSODirectoryContactFetcher.h"

/**
* The header for type MSODirectoryContactCollectionFetcher.
*/

@protocol MSODirectoryContactCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryContact> *contacts, NSError *error))callback;

@end

@interface MSODirectoryContactCollectionFetcher : MSODataCollectionFetcher<MSODirectoryContactCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryContact* )entity withCallback:(void (^)(MSODirectoryContact *contact, NSError *e))callback;

-(MSODirectoryContactFetcher*)getById:(NSString *)Id;

@end