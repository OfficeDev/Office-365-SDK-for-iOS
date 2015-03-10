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

@class MSGraphServiceCalendarViewFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceCalendarViewCollectionFetcher.
*/

@protocol MSGraphServiceCalendarViewCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceCalendarView> *calendarViews, MSODataException *error))callback;

-(id<MSGraphServiceCalendarViewCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceCalendarViewCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceCalendarViewCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceCalendarViewCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceCalendarViewCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceCalendarViewCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceCalendarViewCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceCalendarViewCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceCalendarViewFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addCalendarView:(MSGraphServiceCalendarView* )entity withCallback:(void (^)(MSGraphServiceCalendarView *calendarView, MSODataException *e))callback;

@end

@interface MSGraphServiceCalendarViewCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceCalendarViewCollectionFetcher>

@end