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
#import "MSOOutlookEvent.h"
#import "MSOOutlookEventFetcher.h"

/**
* The header for type MSOOutlookEventCollectionFetcher.
*/

@protocol MSOOutlookEventCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookEvent> *events, NSError *error))callback;

@end

@interface MSOOutlookEventCollectionFetcher : MSODataCollectionFetcher<MSOOutlookEventCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookEvent* )entity withCallback:(void (^)(MSOOutlookEvent *event, NSError *e))callback;

-(MSOOutlookEventFetcher*)getById:(NSString *)Id;

@end