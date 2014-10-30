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

#import "MSOutlookMessage.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookMessageFetcher.h"

/**
* The header for type MSOutlookMessageCollectionFetcher.
*/

@protocol MSOutlookMessageCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookMessage> *messages, NSError *error))callback;

@end

@interface MSOutlookMessageCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookMessageCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookMessage* )entity :(void (^)(MSOutlookMessage *message, NSError *e))callback;

-(MSOutlookMessageFetcher*)getById:(NSString *)Id;

@end
