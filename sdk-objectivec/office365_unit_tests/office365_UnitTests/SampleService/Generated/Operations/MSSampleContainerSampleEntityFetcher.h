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
#import "MSSampleContainerSampleEntityOperations.h"
#import "MSSampleContainerSampleEntity.h"
#import "MSSampleContainerAnotherEntityCollectionFetcher.h"
@class MSSampleContainerAnotherEntityFetcher;

/**
* The header for type MSSampleContainerSampleEntityFetcher.
*/

@protocol MSSampleContainerSampleEntityFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSSampleContainerSampleEntity* sampleEntity, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateSampleEntity:(id)entity withCallback:(void (^)(MSSampleContainerSampleEntity*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteSampleEntity:(void (^)(int status, MSODataException * error))callback;
-(id<MSSampleContainerSampleEntityFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSampleContainerSampleEntityFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSSampleContainerSampleEntityFetcher>)select : (NSString*) params;
-(id<MSSampleContainerSampleEntityFetcher>)expand : (NSString*) value;
@end

@interface MSSampleContainerSampleEntityFetcher : MSODataEntityFetcher<MSSampleContainerSampleEntityFetcher>

-(MSSampleContainerSampleEntityOperations*) getOperations;

-(MSSampleContainerAnotherEntityCollectionFetcher*) getNavigations;

-(MSSampleContainerAnotherEntityFetcher*) getNavigationsById : (NSString*)_id;

	
@end