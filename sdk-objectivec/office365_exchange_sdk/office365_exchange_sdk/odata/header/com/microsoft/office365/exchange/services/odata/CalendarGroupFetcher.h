/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataEntityFetcher.h"
#import "CalendarsCollectionFetcher.h"

@interface CalendarGroupFetcher : ODataEntityFetcher

-(CalendarGroupOperations*) getOperations;

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(CalendarCollectionFetcher*) getCalendars;
@end