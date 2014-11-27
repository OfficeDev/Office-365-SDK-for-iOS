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
#import "MSDirectoryContact.h"
#import "MSDirectoryContactFetcher.h"

/**
* The header for type MSDirectoryContactCollectionFetcher.
*/

@protocol MSDirectoryContactCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryContact> *contacts, NSError *error))callback;
-(MSDirectoryContactFetcher*)select : (NSString*) params;
-(MSDirectoryContactFetcher*)filter : (NSString*) params;
-(MSDirectoryContactFetcher*)top : (int) value;
-(MSDirectoryContactFetcher*)skip : (int) value;
-(MSDirectoryContactFetcher*)expand : (NSString*) value;
-(MSDirectoryContactFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectoryContactCollectionFetcher : MSODataCollectionFetcher<MSDirectoryContactCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addContact:(MSDirectoryContact* )entity withCallback:(void (^)(MSDirectoryContact *contact, NSError *e))callback;

-(MSDirectoryContactFetcher*)getById:(NSString *)Id;

@end