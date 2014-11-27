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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookCalendar> *calendars, NSError *error))callback;
-(MSOutlookCalendarFetcher*)select : (NSString*) params;
-(MSOutlookCalendarFetcher*)filter : (NSString*) params;
-(MSOutlookCalendarFetcher*)top : (int) value;
-(MSOutlookCalendarFetcher*)skip : (int) value;
-(MSOutlookCalendarFetcher*)expand : (NSString*) value;
-(MSOutlookCalendarFetcher*)orderBy : (NSString*) params;

@end

@interface MSOutlookCalendarCollectionFetcher : MSODataCollectionFetcher<MSOutlookCalendarCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addCalendar:(MSOutlookCalendar* )entity withCallback:(void (^)(MSOutlookCalendar *calendar, NSError *e))callback;

-(MSOutlookCalendarFetcher*)getById:(NSString *)Id;

@end