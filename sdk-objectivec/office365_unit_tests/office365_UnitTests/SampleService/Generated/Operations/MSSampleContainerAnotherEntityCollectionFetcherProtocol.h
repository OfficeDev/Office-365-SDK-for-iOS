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
#import "MSSampleContainerAnotherEntity.h"
#import "MSSampleContainerAnotherEntityFetcherProtocol.h"

/**
* The header for type MSSampleContainerAnotherEntityCollectionFetcher.
*/

@protocol MSSampleContainerAnotherEntityCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSampleContainerAnotherEntity> *anotherEntitys, MSODataException *error))callback;

-(id<MSSampleContainerAnotherEntityCollectionFetcher>)select : (NSString*) params;
-(id<MSSampleContainerAnotherEntityCollectionFetcher>)filter : (NSString*) params;
-(id<MSSampleContainerAnotherEntityCollectionFetcher>)top : (int) value;
-(id<MSSampleContainerAnotherEntityCollectionFetcher>)skip : (int) value;
-(id<MSSampleContainerAnotherEntityCollectionFetcher>)expand : (NSString*) value;
-(id<MSSampleContainerAnotherEntityCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSSampleContainerAnotherEntityCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSampleContainerAnotherEntityCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(id<MSSampleContainerAnotherEntityFetcher>)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addAnotherEntity:(MSSampleContainerAnotherEntity* )entity withCallback:(void (^)(MSSampleContainerAnotherEntity *anotherEntity, MSODataException *e))callback;

@end