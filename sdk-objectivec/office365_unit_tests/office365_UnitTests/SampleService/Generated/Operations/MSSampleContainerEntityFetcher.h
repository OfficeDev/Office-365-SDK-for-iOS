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
#import "MSSampleContainerEntityOperations.h"
#import "MSSampleContainerEntity.h"


#import "MSSampleContainerAnotherEntityFetcher.h"
#import "MSSampleContainerSampleEntityFetcher.h"
/**
* The header for type MSSampleContainerEntityFetcher.
*/

@protocol MSSampleContainerEntityFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSSampleContainerEntity* entity, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateEntity:(id)entity withCallback:(void (^)(MSSampleContainerEntity*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteEntity:(void (^)(int status, MSODataException * error))callback;
-(id<MSSampleContainerEntityFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSampleContainerEntityFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSSampleContainerEntityFetcher>)select : (NSString*) params;
-(id<MSSampleContainerEntityFetcher>)expand : (NSString*) value;
@end

@interface MSSampleContainerEntityFetcher : MSODataEntityFetcher<MSSampleContainerEntityFetcher>

-(MSSampleContainerEntityOperations*) getOperations;

	
	
-(MSSampleContainerAnotherEntityFetcher*) asAnotherEntity;	
	
	
-(MSSampleContainerSampleEntityFetcher*) asSampleEntity;	
	
@end