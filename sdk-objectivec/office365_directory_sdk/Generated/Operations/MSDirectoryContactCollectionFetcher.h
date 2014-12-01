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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryContact> *contacts, MSODataException *error))callback;

-(id<MSDirectoryContactCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryContactCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryContactCollectionFetcher>)top : (int) value;
-(id<MSDirectoryContactCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryContactCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryContactCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryContactCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryContactCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryContactCollectionFetcher : MSODataCollectionFetcher<MSDirectoryContactCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryContactFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addContact:(MSDirectoryContact* )entity withCallback:(void (^)(MSDirectoryContact *contact, MSODataException *e))callback;

@end