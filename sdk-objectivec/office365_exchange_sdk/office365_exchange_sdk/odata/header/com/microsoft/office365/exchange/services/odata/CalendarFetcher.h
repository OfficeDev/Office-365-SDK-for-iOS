/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataEntityFetcher.h"
#import "EventsCollectionFetcher.h"

@interface CalendarFetcher : ODataEntityFetcher

-(CalendarOperations*) getOperations;

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(EventCollectionFetcher*) getEvents;
@end