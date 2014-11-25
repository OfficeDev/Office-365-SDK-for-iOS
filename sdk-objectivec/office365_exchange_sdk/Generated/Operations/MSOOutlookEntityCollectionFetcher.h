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
#import "MSOOutlookEntity.h"
#import "MSOOutlookEntityFetcher.h"

/**
* The header for type MSOOutlookEntityCollectionFetcher.
*/

@protocol MSOOutlookEntityCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookEntity> *entitys, NSError *error))callback;

@end

@interface MSOOutlookEntityCollectionFetcher : MSODataCollectionFetcher<MSOOutlookEntityCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookEntity* )entity withCallback:(void (^)(MSOOutlookEntity *entity, NSError *e))callback;

-(MSOOutlookEntityFetcher*)getById:(NSString *)Id;

@end