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
#import "MSSampleContainerAnotherEntityOperations.h"
#import "MSSampleContainerAnotherEntity.h"




/**
* The header for type MSSampleContainerAnotherEntityFetcher.
*/

@protocol MSSampleContainerAnotherEntityFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSSampleContainerAnotherEntity* anotherEntity, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateAnotherEntity:(id)entity withCallback:(void (^)(MSSampleContainerAnotherEntity*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteAnotherEntity:(void (^)(int status, MSODataException * error))callback;
-(id<MSSampleContainerAnotherEntityFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSampleContainerAnotherEntityFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSSampleContainerAnotherEntityFetcher>)select : (NSString*) params;
-(id<MSSampleContainerAnotherEntityFetcher>)expand : (NSString*) value;

@required
-(MSSampleContainerAnotherEntityOperations*) getOperations;

	
@end