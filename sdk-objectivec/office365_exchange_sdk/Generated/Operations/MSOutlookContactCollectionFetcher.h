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
#import "MSOutlookContact.h"
#import "MSOutlookContactFetcher.h"

/**
* The header for type MSOutlookContactCollectionFetcher.
*/

@protocol MSOutlookContactCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookContact> *contacts, MSODataException *error))callback;

-(id<MSOutlookContactCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookContactCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookContactCollectionFetcher>)top : (int) value;
-(id<MSOutlookContactCollectionFetcher>)skip : (int) value;
-(id<MSOutlookContactCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookContactCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookContactCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookContactCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSOutlookContactCollectionFetcher : MSODataCollectionFetcher<MSOutlookContactCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookContactFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addContact:(MSOutlookContact* )entity withCallback:(void (^)(MSOutlookContact *contact, MSODataException *e))callback;

@end