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
#import "MSSampleContainerSampleEntity.h"
#import "MSSampleContainerSampleEntityFetcher.h"

/**
* The header for type MSSampleContainerSampleEntityCollectionFetcher.
*/

@protocol MSSampleContainerSampleEntityCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSampleContainerSampleEntity> *sampleEntitys, MSODataException *error))callback;

-(id<MSSampleContainerSampleEntityCollectionFetcher>)select : (NSString*) params;
-(id<MSSampleContainerSampleEntityCollectionFetcher>)filter : (NSString*) params;
-(id<MSSampleContainerSampleEntityCollectionFetcher>)top : (int) value;
-(id<MSSampleContainerSampleEntityCollectionFetcher>)skip : (int) value;
-(id<MSSampleContainerSampleEntityCollectionFetcher>)expand : (NSString*) value;
-(id<MSSampleContainerSampleEntityCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSSampleContainerSampleEntityCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSampleContainerSampleEntityCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSSampleContainerSampleEntityCollectionFetcher : MSODataCollectionFetcher<MSSampleContainerSampleEntityCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSSampleContainerSampleEntityFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addSampleEntity:(MSSampleContainerSampleEntity* )entity withCallback:(void (^)(MSSampleContainerSampleEntity *sampleEntity, MSODataException *e))callback;

@end