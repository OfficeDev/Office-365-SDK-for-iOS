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

#import "MSOutlookCalendarFetcher.h"
#import "MSOutlookEventCollectionFetcher.h"
#import "MSOutlookEventCollectionFetcher.h"


/**
* The implementation file for type MSOutlookCalendarFetcher.
*/


@implementation MSOutlookCalendarFetcher
-(MSOutlookCalendarOperations*) getOperations{
	return [[MSOutlookCalendarOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookCalendar class]];
}

-(MSOutlookEventCollectionFetcher*) getCalendarView{
    return [[MSOutlookEventCollectionFetcher alloc] initWith:@"CalendarView" :self : [MSOutlookEvent class]];
}

-(MSOutlookEventCollectionFetcher*) getEvents{
    return [[MSOutlookEventCollectionFetcher alloc] initWith:@"Events" :self : [MSOutlookEvent class]];
}


@end