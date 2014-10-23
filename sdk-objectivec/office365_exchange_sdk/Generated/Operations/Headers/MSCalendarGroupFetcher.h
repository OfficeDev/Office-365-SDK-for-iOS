/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSCalendarGroupOperations.h"
#import "MSCalendarGroup.h"
@class MSCalendarCollectionFetcher;

/**
* The header for type MSCalendarGroupFetcher.
*/

@protocol MSCalendarGroupFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSCalendarGroup* calendarGroup, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSCalendarGroup*, NSError * error))callback;
@end

@interface MSCalendarGroupFetcher : MSODataEntityFetcher<MSCalendarGroupFetcher>

-(MSCalendarGroupOperations*) getOperations;
-(MSCalendarCollectionFetcher*) getCalendars;
	
@end