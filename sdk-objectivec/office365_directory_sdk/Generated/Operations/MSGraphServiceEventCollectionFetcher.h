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

@class MSGraphServiceEventFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceEventCollectionFetcher.
*/

@protocol MSGraphServiceEventCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceEvent> *events, MSODataException *error))callback;

-(id<MSGraphServiceEventCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceEventCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceEventCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceEventCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceEventCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceEventCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceEventCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceEventCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceEventFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addEvent:(MSGraphServiceEvent* )entity withCallback:(void (^)(MSGraphServiceEvent *event, MSODataException *e))callback;

@end

@interface MSGraphServiceEventCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceEventCollectionFetcher>

@end