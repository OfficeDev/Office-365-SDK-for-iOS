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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookMessage> *messages, MSODataException *error))callback;

-(id<MSOutlookMessageCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookMessageCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookMessageCollectionFetcher>)top : (int) value;
-(id<MSOutlookMessageCollectionFetcher>)skip : (int) value;
-(id<MSOutlookMessageCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookMessageCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookMessageCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookMessageCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSOutlookMessageCollectionFetcher : MSODataCollectionFetcher<MSOutlookMessageCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookMessageFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addMessage:(MSOutlookMessage* )entity withCallback:(void (^)(MSOutlookMessage *message, MSODataException *e))callback;

@end