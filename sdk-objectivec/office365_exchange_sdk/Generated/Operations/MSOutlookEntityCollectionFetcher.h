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
#import "MSOutlookEntity.h"
#import "MSOutlookEntityFetcher.h"

/**
* The header for type MSOutlookEntityCollectionFetcher.
*/

@protocol MSOutlookEntityCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookEntity> *entitys, NSError *error))callback;
-(MSOutlookEntityFetcher*)select : (NSString*) params;
-(MSOutlookEntityFetcher*)filter : (NSString*) params;
-(MSOutlookEntityFetcher*)top : (int) value;
-(MSOutlookEntityFetcher*)skip : (int) value;
-(MSOutlookEntityFetcher*)expand : (NSString*) value;
-(MSOutlookEntityFetcher*)orderBy : (NSString*) params;

@end

@interface MSOutlookEntityCollectionFetcher : MSODataCollectionFetcher<MSOutlookEntityCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOutlookEntity* )entity withCallback:(void (^)(MSOutlookEntity *entity, NSError *e))callback;

-(MSOutlookEntityFetcher*)getById:(NSString *)Id;

@end