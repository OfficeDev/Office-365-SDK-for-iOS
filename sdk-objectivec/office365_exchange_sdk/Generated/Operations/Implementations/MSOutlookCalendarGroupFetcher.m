/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookCalendarGroupFetcher.h"
#import "MSOutlookCalendarCollectionFetcher.h"


/**
* The implementation file for type MSOutlookCalendarGroupFetcher.
*/


@implementation MSOutlookCalendarGroupFetcher
-(MSOutlookCalendarGroupOperations*) getOperations{
	return [[MSOutlookCalendarGroupOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookCalendarGroup class]];
}

-(MSOutlookCalendarCollectionFetcher*) getCalendars{
    return [[MSOutlookCalendarCollectionFetcher alloc] initWith:@"Calendars" :self : [MSOutlookCalendar class]];
}


@end