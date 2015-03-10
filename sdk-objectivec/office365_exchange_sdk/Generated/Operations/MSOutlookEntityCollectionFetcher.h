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

@class MSOutlookEntityFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookEntityCollectionFetcher.
*/

@protocol MSOutlookEntityCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSOutlookEntity> *entitys, MSODataException *error))callback;

-(id<MSOutlookEntityCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookEntityCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookEntityCollectionFetcher>)top : (int) value;
-(id<MSOutlookEntityCollectionFetcher>)skip : (int) value;
-(id<MSOutlookEntityCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookEntityCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookEntityCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookEntityCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookEntityFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addEntity:(MSOutlookEntity* )entity withCallback:(void (^)(MSOutlookEntity *entity, MSODataException *e))callback;

@end

@interface MSOutlookEntityCollectionFetcher : MSODataCollectionFetcher<MSOutlookEntityCollectionFetcher>

@end