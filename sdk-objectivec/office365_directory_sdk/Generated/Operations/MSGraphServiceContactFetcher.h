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

@class MSGraphServiceDirectoryObjectFetcher;;
@class MSGraphServiceDirectoryObjectCollectionFetcher;;
@class MSGraphServiceContactOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceContactFetcher.
*/


@protocol MSGraphServiceContactFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceContact* contact, MSODataException *error))callback;
-(NSURLSessionTask*) updateContact:(id)entity withCallback:(void (^)(MSGraphServiceContact*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteContact:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceContactFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceContactFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceContactFetcher>)select : (NSString*) params;
-(id<MSGraphServiceContactFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceContactOperations*) getOperations;
-(MSGraphServiceDirectoryObjectFetcher*) getmanager;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getdirectReports;

-(MSGraphServiceDirectoryObjectFetcher*) getdirectReportsById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmemberOf;

-(MSGraphServiceDirectoryObjectFetcher*) getmemberOfById : (NSString*)_id;
@end

@interface MSGraphServiceContactFetcher : MSODataEntityFetcher<MSGraphServiceContactFetcher>

@end