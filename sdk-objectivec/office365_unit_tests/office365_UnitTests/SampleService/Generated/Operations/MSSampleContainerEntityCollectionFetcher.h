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
#import "MSSampleContainerEntity.h"
#import "MSSampleContainerEntityFetcher.h"

/**
* The header for type MSSampleContainerEntityCollectionFetcher.
*/

@protocol MSSampleContainerEntityCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSampleContainerEntity> *entitys, MSODataException *error))callback;

-(id<MSSampleContainerEntityCollectionFetcher>)select : (NSString*) params;
-(id<MSSampleContainerEntityCollectionFetcher>)filter : (NSString*) params;
-(id<MSSampleContainerEntityCollectionFetcher>)top : (int) value;
-(id<MSSampleContainerEntityCollectionFetcher>)skip : (int) value;
-(id<MSSampleContainerEntityCollectionFetcher>)expand : (NSString*) value;
-(id<MSSampleContainerEntityCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSSampleContainerEntityCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSampleContainerEntityCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSSampleContainerEntityCollectionFetcher : MSODataCollectionFetcher<MSSampleContainerEntityCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSSampleContainerEntityFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addEntity:(MSSampleContainerEntity* )entity withCallback:(void (^)(MSSampleContainerEntity *entity, MSODataException *e))callback;

@end