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
#import "MSOOutlookMessage.h"
#import "MSOOutlookMessageFetcher.h"

/**
* The header for type MSOOutlookMessageCollectionFetcher.
*/

@protocol MSOOutlookMessageCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookMessage> *messages, NSError *error))callback;

@end

@interface MSOOutlookMessageCollectionFetcher : MSODataCollectionFetcher<MSOOutlookMessageCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookMessage* )entity withCallback:(void (^)(MSOOutlookMessage *message, NSError *e))callback;

-(MSOOutlookMessageFetcher*)getById:(NSString *)Id;

@end