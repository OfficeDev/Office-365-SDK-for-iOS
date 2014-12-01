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
#import "MSOutlookCalendar.h"
#import "MSOutlookCalendarFetcher.h"

/**
* The header for type MSOutlookCalendarCollectionFetcher.
*/

@protocol MSOutlookCalendarCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookCalendar> *calendars, MSODataException *error))callback;

-(id<MSOutlookCalendarCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookCalendarCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookCalendarCollectionFetcher>)top : (int) value;
-(id<MSOutlookCalendarCollectionFetcher>)skip : (int) value;
-(id<MSOutlookCalendarCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookCalendarCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookCalendarCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookCalendarCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSOutlookCalendarCollectionFetcher : MSODataCollectionFetcher<MSOutlookCalendarCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookCalendarFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addCalendar:(MSOutlookCalendar* )entity withCallback:(void (^)(MSOutlookCalendar *calendar, MSODataException *e))callback;

@end