/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarGroupFetcher.h"
#import "MSOCalendarCollectionFetcher.h"


/**
* The implementation file for type MSOCalendarGroupFetcher.
*/

@implementation MSOCalendarGroupFetcher
-(MSOCalendarGroupOperations*) getOperations{
	return [[MSOCalendarGroupOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOCalendarGroup class]];
}

-(MSOCalendarCollectionFetcher*) getCalendars{
    return [[MSOCalendarCollectionFetcher alloc] initWith:@"Calendars" :self : [MSOCalendar class]];
}

@end