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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookContact> *contacts, NSError *error))callback;

@end

@interface MSOutlookContactCollectionFetcher : MSODataCollectionFetcher<MSOutlookContactCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOutlookContact* )entity withCallback:(void (^)(MSOutlookContact *contact, NSError *e))callback;

-(MSOutlookContactFetcher*)getById:(NSString *)Id;

@end