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
#import "MSOutlookMessage.h"
#import "MSOutlookMessageFetcher.h"

/**
* The header for type MSOutlookMessageCollectionFetcher.
*/

@protocol MSOutlookMessageCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookMessage> *messages, NSError *error))callback;
-(MSOutlookMessageFetcher*)select : (NSString*) params;
-(MSOutlookMessageFetcher*)filter : (NSString*) params;
-(MSOutlookMessageFetcher*)top : (int) value;
-(MSOutlookMessageFetcher*)skip : (int) value;
-(MSOutlookMessageFetcher*)expand : (NSString*) value;
-(MSOutlookMessageFetcher*)orderBy : (NSString*) params;

@end

@interface MSOutlookMessageCollectionFetcher : MSODataCollectionFetcher<MSOutlookMessageCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addMessage:(MSOutlookMessage* )entity withCallback:(void (^)(MSOutlookMessage *message, NSError *e))callback;

-(MSOutlookMessageFetcher*)getById:(NSString *)Id;

@end