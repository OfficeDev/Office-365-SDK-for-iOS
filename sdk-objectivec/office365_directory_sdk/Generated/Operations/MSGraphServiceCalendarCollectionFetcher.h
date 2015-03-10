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

@class MSGraphServiceCalendarFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceCalendarCollectionFetcher.
*/

@protocol MSGraphServiceCalendarCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceCalendar> *calendars, MSODataException *error))callback;

-(id<MSGraphServiceCalendarCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceCalendarCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceCalendarCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceCalendarCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceCalendarCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceCalendarCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceCalendarCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceCalendarCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceCalendarFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addCalendar:(MSGraphServiceCalendar* )entity withCallback:(void (^)(MSGraphServiceCalendar *calendar, MSODataException *e))callback;

@end

@interface MSGraphServiceCalendarCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceCalendarCollectionFetcher>

@end