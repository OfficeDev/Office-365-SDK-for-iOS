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

#import "MSOutlookEntity.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookEntityFetcher.h"

/**
* The header for type MSOutlookEntityCollectionFetcher.
*/

@protocol MSOutlookEntityCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookEntity> *entitys, NSError *error))callback;

@end

@interface MSOutlookEntityCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookEntityCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookEntity* )entity :(void (^)(MSOutlookEntity *entity, NSError *e))callback;

-(MSOutlookEntityFetcher*)getById:(NSString *)Id;

@end
