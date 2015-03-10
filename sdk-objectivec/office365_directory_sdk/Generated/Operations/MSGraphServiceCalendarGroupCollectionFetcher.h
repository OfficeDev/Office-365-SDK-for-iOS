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

@class MSGraphServiceCalendarGroupFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceCalendarGroupCollectionFetcher.
*/

@protocol MSGraphServiceCalendarGroupCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceCalendarGroup> *calendarGroups, MSODataException *error))callback;

-(id<MSGraphServiceCalendarGroupCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceCalendarGroupCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceCalendarGroupCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceCalendarGroupCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceCalendarGroupCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceCalendarGroupCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceCalendarGroupCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceCalendarGroupCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceCalendarGroupFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addCalendarGroup:(MSGraphServiceCalendarGroup* )entity withCallback:(void (^)(MSGraphServiceCalendarGroup *calendarGroup, MSODataException *e))callback;

@end

@interface MSGraphServiceCalendarGroupCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceCalendarGroupCollectionFetcher>

@end