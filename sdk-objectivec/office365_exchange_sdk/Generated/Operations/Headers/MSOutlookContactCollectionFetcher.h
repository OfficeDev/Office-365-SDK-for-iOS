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

#import "MSOutlookContact.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookContactFetcher.h"

/**
* The header for type MSOutlookContactCollectionFetcher.
*/

@protocol MSOutlookContactCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookContact> *contacts, NSError *error))callback;

@end

@interface MSOutlookContactCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookContactCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookContact* )entity :(void (^)(MSOutlookContact *contact, NSError *e))callback;

-(MSOutlookContactFetcher*)getById:(NSString *)Id;

@end
