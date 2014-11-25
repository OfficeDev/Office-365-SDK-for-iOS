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
#import "MSOOutlookContact.h"
#import "MSOOutlookContactFetcher.h"

/**
* The header for type MSOOutlookContactCollectionFetcher.
*/

@protocol MSOOutlookContactCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookContact> *contacts, NSError *error))callback;

@end

@interface MSOOutlookContactCollectionFetcher : MSODataCollectionFetcher<MSOOutlookContactCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookContact* )entity withCallback:(void (^)(MSOOutlookContact *contact, NSError *e))callback;

-(MSOOutlookContactFetcher*)getById:(NSString *)Id;

@end